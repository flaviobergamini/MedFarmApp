import 'package:flutter/material.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Controller/DoctorController.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/Model/Requests/DoctorAppointmentConfirmedRequestModel.dart';
import 'package:medfarm/View/PendingMedicalRequests.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DoctorLoginPage extends StatefulWidget {
  const DoctorLoginPage({Key? key}) : super(key: key);

  @override
  State<DoctorLoginPage> createState() => _DoctorLoginPageState();
}

var DoctorControllerAPI = new DoctorController();

class _DoctorLoginPageState extends State<DoctorLoginPage> {
  List<Map<String, dynamic>> ConfirmedAppointments = [];
  List<Map<String, dynamic>> PendingAppointments = [];


  Future<List<List<dynamic>>> getLists() async {
    DateTime date = DateTime.now();

    var appointmentConfirmed = new DoctorAppointmentConfirmedRequestModel(AuthController.userId, '${date.year}-${date.month}-${date.day}');

    var appointmentsConfirmed = await DoctorControllerAPI.getAppointmentConfirmed(
        appointmentConfirmed);
    var appointmentsPending = await DoctorControllerAPI.getAppointmentPending();

    List<List<dynamic>> lists = <List<dynamic>>[];

    lists.add(appointmentsConfirmed);
    lists.add(appointmentsPending);

    return lists;
  }

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: FutureBuilder<List<List<dynamic>>>(
          future: getLists(),
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
                  ConfirmedAppointments.clear();
                  PendingAppointments.clear();

                  //Trabalhar com as listas aqui
                  List<dynamic> confirmeds = snapshot.data![0];

                  confirmeds.forEach((confirmed) {
                    var remote = 'Presencial';

                    if (confirmed['remote'])
                      remote = 'Remoto';

                    ConfirmedAppointments.add({
                      'name': confirmed['name'],
                      'date': confirmed['date'],
                      'remote': remote
                    });
                  });

                  List<dynamic> pendings = snapshot.data![1];
                  
                  pendings.forEach((request) {
                    PendingAppointments.add({
                      'id': request['id'],
                      'userId': request['userId'],
                      'name': request['name'],
                      'date': request['date'],
                    });
                  });


                  return SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 45, bottom: 15),
                    child: Column(
                      children: [
                        const Text(
                          'Profissional de Saúde',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
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
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 17, right: 17),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(padding: EdgeInsets.all(5)),
                                  medFarmWidgetsForm.TitleTextLabelBlue(
                                      "Consultas agendadas no dia"),
                                  Divider(),
                                  Container(
                                    height: 200,
                                    child: ListView(
                                      children: <Widget>[
                                        for (Map<String, dynamic> appointment
                                            in ConfirmedAppointments)
                                          ListTile(
                                            title: Text(appointment['name']),
                                            subtitle: Text('${appointment['remote']}; ${appointment['date']}'),
                                            leading: Icon(
                                              Icons.person,
                                              size: 30,
                                            ),
                                            onTap: () {
                                              print("Horário: " + appointment['name']);
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
                        const Padding(padding: EdgeInsets.all(20)),
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
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 17, right: 17),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(padding: EdgeInsets.all(5)),
                                  medFarmWidgetsForm.TitleTextLabelBlue(
                                      "Solicitações"),
                                  Divider(),
                                  Container(
                                    height: 200,
                                    child: ListView(
                                      children: <Widget>[
                                        for (Map<String, dynamic> pendingAppointment
                                            in PendingAppointments)
                                          ListTile(
                                            title: Text(pendingAppointment['name']),
                                            subtitle: Text(pendingAppointment['date']),
                                            leading: Icon(
                                              Icons.person_add_alt_1,
                                              size: 30,
                                            ),
                                            onTap: () {
                                              Utils.setClientIdAppointment(pendingAppointment['userId']);
                                              Utils.setAppointmentPending(pendingAppointment['id']);

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PendingMedicalRequests()),
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
          }),
    );
  }
}
