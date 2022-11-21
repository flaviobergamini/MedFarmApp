import 'package:flutter/material.dart';
import 'package:medfarm/Controller/ClientController.dart';
import 'package:medfarm/Controller/Statics/ClientSearch.dart';
import 'package:medfarm/Model/Requests/ClientSearchModel.dart';
import 'package:medfarm/View/DrugstoreConsultation.dart';

class DrugstoreClient extends StatefulWidget {
  const DrugstoreClient({Key? key}) : super(key: key);

  @override
  State<DrugstoreClient> createState() => _DrugstoreClientState();
}

class _DrugstoreClientState extends State<DrugstoreClient> {
  List<String> ListDrugstores = [
  ];

  @override
  Widget build(BuildContext context) {
    var ClientControllerAPI = new ClientController();

    var Request = new ClientSearchModel(
        ClientSearch.getCategory, '', ClientSearch.getCity);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: FutureBuilder<List<dynamic>>(
        future:
            ClientControllerAPI.postSearch(Request, ClientSearch.getCategory),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
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

                ListDrugstores.clear();

                List<dynamic> drugstores = snapshot.data!;

                drugstores.forEach((drugstore) {
                  String name = drugstore['name'];
                  String district = drugstore['district'];
                  String street = drugstore['street'];
                  int streetNumber = drugstore['streetNumber'];

                  ListDrugstores.add('$name; $district; $street; $streetNumber');

                });

                return SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 45, bottom: 15),
                  child: Column(
                    children: [
                      const Text(
                        'Farmácias',
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
                                const Padding(padding: EdgeInsets.all(5)),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 17),
                                  height: 550,
                                  child: ListView(
                                    children: <Widget>[
                                      for (String drugstore in ListDrugstores)
                                        ListTile(
                                          title: Text(
                                            drugstore.substring(
                                                0, drugstore.indexOf(';')),
                                          ),
                                          subtitle: Text(drugstore.substring(
                                              drugstore.indexOf(';') + 1,
                                              drugstore.length)),
                                          leading: Icon(
                                            Icons.add_business,
                                            size: 30,
                                          ),
                                          onTap: () {
                                            print("Horário: " + drugstore);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DrugstoreConsultation()),
                                            );
                                          },
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
        },
      ),
    );
  }
}
