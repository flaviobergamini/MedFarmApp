import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Controller/ClientController.dart';
import 'package:medfarm/Controller/ImageOrderController.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DrugstoreConsultation extends StatefulWidget {
  const DrugstoreConsultation({Key? key}) : super(key: key);

  @override
  _DrugstoreConsultationState createState() => _DrugstoreConsultationState();
}

class _DrugstoreConsultationState extends State<DrugstoreConsultation> {
  final dropValue = ValueNotifier('');
  final dropOptions = ["A Vista", "Crédito", "Débito", "PIX"];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var ClientControllerAPI = new ClientController();
    var medFarmWidgetsForm = MedFarmWidgets();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: FutureBuilder<Map>(
        future: ClientControllerAPI.getDrugstoreById(Utils.getDrugstoreId),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                    Text("Carregando Dados", style: TextStyle(color: Colors.white),)
                  ],
                ),);
              default:
                if(snapshot.hasError){
                  return Center(
                    child: Text("Erro ao carregar dados da API",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                else{


                  return SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                    child: Column(
                      children: [
                        const Text(
                          'Farmácia',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 17, right: 17),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Padding(padding: EdgeInsets.all(5)),
                                    medFarmWidgetsForm.TextFieldOutput(
                                        "Nome", snapshot.data!['name']),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    medFarmWidgetsForm.TextFieldOutput(
                                        "Rua", snapshot.data!['street']),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    medFarmWidgetsForm.TextFieldOutput("Nº", "${snapshot.data!['streetNumber']}"),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    medFarmWidgetsForm.TextFieldOutput(
                                        "Bairro", snapshot.data!['district']),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    medFarmWidgetsForm.TextFieldOutput(
                                        "Cidade", snapshot.data!['city']),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    Container(
                                      child: ValueListenableBuilder(
                                        valueListenable: dropValue,
                                        builder: (BuildContext context, String value, _) {
                                          return DropdownButtonFormField<String>(
                                            hint: const Text(
                                              'Pagamento',
                                              style: TextStyle(color: Colors.black),
                                            ),
                                            value: (value.isEmpty) ? null : value,
                                            onChanged: (choice) =>
                                            dropValue.value = choice.toString(),
                                            items: dropOptions
                                                .map(
                                                  (op) => DropdownMenuItem(
                                                value: op,
                                                child: Text(op),
                                              ),
                                            )
                                                .toList(),
                                            decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white.withOpacity(0.5),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(5)),
                              ElevatedButton(
                                onPressed: () async {
                                  var camera = ImageOrderController();

                                  var image = await camera.getImage();
                                  if (image == null) {
                                    medFarmWidgetsForm.ToastMedFarm(context, "Imagem não anexada", false);
                                  }
                                  else{
                                    bool verify = await ClientControllerAPI.postImageOrderClient(image);

                                    if(verify == false)
                                      medFarmWidgetsForm.ToastMedFarm(context, "Falha no envio da imagem", false);
                                    else
                                      medFarmWidgetsForm.ToastMedFarm(context, "Imagem anexada com sucesso", true);
                                  }
                                },
                                child: const Text(
                                  "Anexar Receita",
                                  style: TextStyle(
                                      color: Color.fromRGBO(3, 153, 186, 1), fontSize: 20),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                  const MaterialStatePropertyAll<Color>(Colors.yellow),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side:
                                      const BorderSide(width: 3, color: Colors.yellow),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(5)),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        ElevatedButton(
                          onPressed: () async {
                            DateTime date = new DateTime.now();
                            String dateNow = '${date.year}-${date.month}-${date.day}';

                            var verify = await ClientControllerAPI.postOrderClient(AuthController.userId, Utils.getDrugstoreId, dateNow, dropValue.value);

                            if(verify == false)
                              medFarmWidgetsForm.ToastMedFarm(context, "Falha na solicitação", false);
                            else
                              medFarmWidgetsForm.ToastMedFarm(context, "Solicitação realizada com sucesso", true);
                          },
                          child: const Text(
                            "Solicitar",
                            style: TextStyle(
                                color: Color.fromRGBO(3, 153, 186, 1), fontSize: 20),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.yellow),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(width: 3, color: Colors.yellow),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            }
          }
      )
    );
  }
}
