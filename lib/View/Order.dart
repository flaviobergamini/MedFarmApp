import 'package:flutter/material.dart';
import 'package:medfarm/Controller/CoreAPI.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

import 'OrderImage.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    var MedFarmWidgetsForm = MedFarmWidgets();
    var CoreOrder = CoreAPI();
    String name = "Flávio Henrique Mdureira Bergamini";
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
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
                          MedFarmWidgetsForm.textFieldOutput(
                              "Nome", name),
                          const Padding(padding: EdgeInsets.all(5)),
                          MedFarmWidgetsForm.textFieldOutput(
                              "Rua", "Brasiliano Salomon"),
                          const Padding(padding: EdgeInsets.all(5)),
                          MedFarmWidgetsForm.textFieldOutput("Nº", "33"),
                          const Padding(padding: EdgeInsets.all(5)),
                          MedFarmWidgetsForm.textFieldOutput(
                              "Bairro", "Delcides Teles"),
                          const Padding(padding: EdgeInsets.all(5)),
                          MedFarmWidgetsForm.textFieldOutput(
                              "Cidade", "Santa Rita do Sapucaí"),
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
                                      image: NetworkImage(CoreOrder.getOrderImage()),
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
      ),
    );
  }
}
