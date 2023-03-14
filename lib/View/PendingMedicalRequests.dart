import 'package:flutter/material.dart';
import 'package:medfarm/Controller/DoctorController.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class PendingMedicalRequests extends StatefulWidget {
  const PendingMedicalRequests({Key? key}) : super(key: key);

  @override
  State<PendingMedicalRequests> createState() => _PendingMedicalRequestsState();
}

class _PendingMedicalRequestsState extends State<PendingMedicalRequests> {

  @override
  Widget build(BuildContext context) {
    var DoctorControllerAPI = DoctorController();
    var MedFarmWidgetsForm = new MedFarmWidgets();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: FutureBuilder<Map>(
          future: DoctorControllerAPI.getAppointmentPendingClientById(Utils.getClientIdAppointment),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                      Text(
                        "Carregando Dados",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao carregar dados da API",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  print(snapshot.data!);
                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 45, bottom: 15),
                    child: Column(
                      children: [
                        const Text(
                          'Solicitação Pendente',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 17, right: 17, bottom: 17),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 17, right: 17),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                       const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "Nome", snapshot.data!['name']),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "Rua", snapshot.data!['street']),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "Nº", '${snapshot.data!['streetNumber']}'),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "Bairro", snapshot.data!['district']),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "Cidade", snapshot.data!['city']),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "CEP", snapshot.data!['cep']),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "Telefone", snapshot.data!['phone']),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "E-mail", snapshot.data!['email']),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        MedFarmWidgetsForm.TextFieldOutput(
                                            "CPF", snapshot.data!['cpf']),
                                        const Padding(
                                            padding: EdgeInsets.all(10)),
                                        ElevatedButton(
                                          onPressed: () async {
                                            var verify = await DoctorControllerAPI
                                          .patchConfirmed(Utils.getAppointmentPending);

                                            if (verify == true){
                                              MedFarmWidgetsForm.ToastMedFarm(
                                                  context, "Consulta confirmada¹",
                                                  true);
                                            }
                                            else {
                                              MedFarmWidgetsForm.ToastMedFarm(
                                                  context, "Falha na confirmação",
                                                  false);
                                            }
                                          },
                                          child: Text(
                                            "Confirmar",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    3, 153, 186, 1),
                                                fontSize: 17),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.yellow),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                side: BorderSide(
                                                    width: 3,
                                                    color: Colors.yellow),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(2)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}
