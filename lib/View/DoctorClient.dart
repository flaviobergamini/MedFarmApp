import 'package:flutter/material.dart';
import 'package:medfarm/Controller/ClientController.dart';
import 'package:medfarm/Controller/Statics/ClientSearch.dart';
import 'package:medfarm/Model/Requests/ClientSearchModel.dart';
import 'package:medfarm/View/DoctorConsultation.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DoctorClient extends StatefulWidget {
  const DoctorClient({Key? key}) : super(key: key);

  @override
  State<DoctorClient> createState() => _DoctorClientState();
}

class _DoctorClientState extends State<DoctorClient> {
  final specialtyController = TextEditingController();

  List<String> ListDoctors = [
    "Flávio Henrique Madureira Bergamini; Remoto; 31/10/2022 08:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 09:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 11:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 12:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 13:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 14:00",
    "Flávio Henrique Madureira Bergamini; Remoto; 31/10/2022 15:00",
    "Flávio Henrique Madureira Bergamini; Remoto; 31/10/2022 16:00",
    "Flávio Henrique Madureira Bergamini; Remoto; 31/10/2022 17:00"
  ];

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();

    var ClientControllerAPI = new ClientController();

    var Request = new ClientSearchModel(
        ClientSearch.getCategory, ClientSearch.getSpecialty, ClientSearch.getCity);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body:FutureBuilder<List<dynamic>>(
        future: ClientControllerAPI.postSearch(Request, ClientSearch.getCategory),
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
                // trabalhar com lista aqui
                ListDoctors.clear();

                List<dynamic> drugstores = snapshot.data!;

                drugstores.forEach((drugstore) {
                  String name = drugstore['name'];
                  String district = drugstore['district'];
                  String street = drugstore['street'];
                  int streetNumber = drugstore['streetNumber'];

                  ListDoctors.add('$name; $district; $street; $streetNumber');

                });

                return SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 45, bottom: 15),
                  child: Column(
                    children: [
                      const Text(
                        'Médicos',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 25,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      /*Container(
                        padding: const EdgeInsets.only(left: 17, right: 17, top: 17),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Seleciona a especialidade do médico:",
                              style: TextStyle(
                                  color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            medFarmWidgetsForm.TextFieldMedFarm(specialtyController),
                          ],
                        ),
                      ), */
                      const Padding(padding: EdgeInsets.all(5)),
                      Container(
                        padding: const EdgeInsets.only(left: 17, right: 17, top: 17),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Médicos disponíveis:",
                              style: TextStyle(
                                  color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
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
                                Container(
                                  padding: const EdgeInsets.only(bottom: 17),
                                  height: 400,
                                  child: ListView(
                                    children: <Widget>[
                                      for (String drugstore in ListDoctors)
                                        ListTile(
                                          title: Text(drugstore.substring(0, drugstore.indexOf(';')),),
                                          subtitle: Text(drugstore.substring(drugstore.indexOf(';') + 1, drugstore.length)),
                                          leading: Icon(Icons.medical_services, size: 30,),
                                          onTap: () {
                                            print("Horário: " + drugstore);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DoctorConsultation()),
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
      )
    );
  }
}
