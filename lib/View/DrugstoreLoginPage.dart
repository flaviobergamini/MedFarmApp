import 'package:flutter/material.dart';
import 'package:medfarm/Controller/DrugstoreController.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/View/Order.dart';

class DrugstoreLoginPage extends StatefulWidget {
  const DrugstoreLoginPage({Key? key}) : super(key: key);

  @override
  State<DrugstoreLoginPage> createState() => _DrugstoreLoginPageState();
}

var DrugstoreControllerAPI = new DrugstoreController();

class _DrugstoreLoginPageState extends State<DrugstoreLoginPage> {
  List<Map> PendingOrders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: FutureBuilder<List<dynamic>>(
        future: DrugstoreControllerAPI.getOrderPending(),
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
                else {
                  PendingOrders.clear();

                  List<dynamic> listPending = snapshot.data!;

                  listPending.forEach((order) {
                    PendingOrders.add({
                      'id':order['id'],
                      'name':order['name']
                    });
                  });

                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 45, bottom: 15),
                    child: Column(
                      children: [
                        const Text(
                          'Pedidos',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        Container(
                          padding: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
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
                                  const Padding(padding: EdgeInsets.all(5)),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 17),
                                    height: 550,
                                    child: ListView(
                                      children: <Widget>[
                                        for (Map order in PendingOrders)
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                flex: 2,
                                                child: ListTile(
                                                  title: Text(order['name']),
                                                ),
                                              ),
                                              Flexible(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    PendingOrders.remove(order);

                                                    Utils.setOrderPending(order['id']);

                                                    DrugstoreControllerAPI.patchConfirmed(order['id']);

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => Order()),
                                                    );
                                                  },
                                                  child: Text(
                                                    "Confirmar",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(3, 153, 186, 1), fontSize: 15),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStatePropertyAll<Color>(Colors.yellow),
                                                    shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(30.0),
                                                        side: BorderSide(width: 3, color: Colors.yellow),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
          }
      )
    );
  }
}
