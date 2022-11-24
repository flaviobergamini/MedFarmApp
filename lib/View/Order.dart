import 'package:flutter/material.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Controller/DrugstoreController.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

import 'OrderImage.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

var DrugstoreControllerAPI = new DrugstoreController();

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    var MedFarmWidgetsForm = MedFarmWidgets();
    var CoreOrder = AuthController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: FutureBuilder<Map>(
        future: DrugstoreControllerAPI.getOrderConfirmedClientById(Utils.getOrderPending),
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
                  Text(
                    "Carregando Dados",
                    style: TextStyle(color: Colors.white),
                  )
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
                print(snapshot.data!);
                Utils.setImageOrder(snapshot.data!['image']);
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 45, bottom: 15),
                  child: Column(
                    children: [
                      const Text(
                        'Receita Médica',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 25,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                      Container(
                        padding: EdgeInsets.only(left: 17, right: 17),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(left: 17, right: 17),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Padding(padding: EdgeInsets.all(5)),
                                    MedFarmWidgetsForm.TextFieldOutput(
                                        "Nome", snapshot.data!['name']),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    MedFarmWidgetsForm.TextFieldOutput(
                                        "Rua", snapshot.data!['street']),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    MedFarmWidgetsForm.TextFieldOutput("Nº", "${snapshot.data!['streetNumber']}"),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    MedFarmWidgetsForm.TextFieldOutput(
                                        "Bairro", snapshot.data!['district']),
                                    const Padding(padding: EdgeInsets.all(5)),
                                    MedFarmWidgetsForm.TextFieldOutput(
                                        "Cidade", snapshot.data!['city']),
                                    const Padding(padding: EdgeInsets.all(10)),
                                    Container(
                                      padding: const EdgeInsets.only(left: 17, right: 17, top: 8, bottom: 8),
                                      height: 250,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                        const BorderRadius.all(Radius.circular(25)),
                                      ),
                                      child: GestureDetector(
                                        onTap: ()  {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => OrderImage()),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(Utils.getImageOrder),
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(50)),
                                          ),),
                                      ),
                                    ),
                                    const Padding(padding: EdgeInsets.all(5)),
                                  ],
                                ),
                              ),
                            ],
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
