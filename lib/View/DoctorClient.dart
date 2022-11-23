import 'package:flutter/material.dart';
import 'package:medfarm/Controller/ClientController.dart';
import 'package:medfarm/Controller/Statics/ClientSearch.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/Model/Requests/ClientSearchModel.dart';
import 'package:medfarm/View/DoctorConsultation.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DoctorClient extends StatefulWidget {
  const DoctorClient({Key? key}) : super(key: key);

  @override
  State<DoctorClient> createState() => _DoctorClientState();
}

class _DoctorClientState extends State<DoctorClient> {
  List<Map<String, dynamic>> ListDoctors = [];
  List<int> ListIds = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ClientControllerAPI = new ClientController();

    var Request = new ClientSearchModel(ClientSearch.getCategory,
        ClientSearch.getSpecialty, ClientSearch.getCity);

    return Scaffold(
        backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
        body: FutureBuilder<List<dynamic>>(
          future:
              ClientControllerAPI.postSearch(Request, ClientSearch.getCategory),
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
                  ListDoctors.clear();
                  ListIds.clear();

                  List<dynamic> doctors = snapshot.data!;

                  doctors.forEach((doctor) {
                    String name = doctor['name'];
                    String district = doctor['district'];
                    String street = doctor['street'];
                    int streetNumber = doctor['streetNumber'];
                    int doctorId = doctor['id'];

                    ListDoctors.add({
                      'name': name,
                      'district': district,
                      'street': street,
                      'streetNumber': streetNumber,
                      'doctorId': doctorId
                    });
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
                        Container(
                          padding: const EdgeInsets.only(
                              left: 17, right: 17, top: 17),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Médicos disponíveis:",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
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
                                    padding: const EdgeInsets.only(bottom: 17),
                                    height: 400,
                                    child: ListView.builder(
                                        itemCount: ListDoctors.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(
                                                ListDoctors[index]['name']),
                                            subtitle: Text(
                                                '${ListDoctors[index]['district']}; ${ListDoctors[index]['street']}; ${ListDoctors[index]['streetNumber']}'),
                                            leading: Icon(
                                              Icons.medical_services,
                                              size: 30,
                                            ),
                                            onTap: () {
                                              Utils.setDoctorId(
                                                  ListDoctors[index]
                                                      ['doctorId']);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DoctorConsultation()),
                                              );
                                            },
                                          );
                                        }),
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
        ));
  }
}
