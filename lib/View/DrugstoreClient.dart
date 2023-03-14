import 'package:flutter/material.dart';
import 'package:medfarm/Controller/ClientController.dart';
import 'package:medfarm/Controller/Statics/ClientSearch.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/Model/Requests/ClientSearchModel.dart';
import 'package:medfarm/View/DrugstoreConsultation.dart';

class DrugstoreClient extends StatefulWidget {
  const DrugstoreClient({Key? key}) : super(key: key);

  @override
  State<DrugstoreClient> createState() => _DrugstoreClientState();
}

class _DrugstoreClientState extends State<DrugstoreClient> {
  List<Map> ListDrugstores = [
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
                  ListDrugstores.add({
                    'id':drugstore['id'],
                    'name':drugstore['name'],
                    'district':drugstore['district'],
                    'street':drugstore['street'],
                    'streetNumber':drugstore['streetNumber']
                  });

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
                                      for (Map drugstore in ListDrugstores)
                                        ListTile(
                                          title: Text(drugstore['name']),
                                          subtitle: Text('${drugstore['district']}; ${drugstore['street']}; ${drugstore['streetNumber']}'),
                                          leading: Icon(
                                            Icons.add_business,
                                            size: 30,
                                          ),
                                          onTap: () {
                                            Utils.setDrugstoreId(drugstore['id']);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DrugstoreConsultation(),),
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
