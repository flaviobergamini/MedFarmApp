import 'package:flutter/material.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DoctorLoginPage extends StatefulWidget {
  const DoctorLoginPage({Key? key}) : super(key: key);

  @override
  State<DoctorLoginPage> createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<DoctorLoginPage> {

  List<String> ConfirmedAppointments = [
    "Flávio Henrique Madureira Bergamini; Remoto; 31/10/2022 08:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 09:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 11:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 12:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 13:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 14:00"];

  List<String> PendingAppointments = [
    "Flávio Henrique Madureira Bergamini",
    "Tainângela Ferreira",
    "Flávio Henrique Madureira Bergamini",
    "Tainângela Ferreira",
    "Flávio Henrique Madureira Bergamini",
    "Tainângela Ferreira",];

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(left: 17, right: 17),
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
                            for(String appointment in ConfirmedAppointments)
                              ListTile(
                                title: Text(appointment.substring(0, appointment.indexOf(';')),),
                                subtitle: Text(appointment.substring(appointment.indexOf(';') + 1, appointment.length)),
                                leading: Icon(Icons.person, size: 30,),
                                onTap: () {
                                  print("Horário: " + appointment);
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
                  padding: const EdgeInsets.only(left: 17, right: 17),
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
                            for(String pendingAppointment in PendingAppointments)
                              ListTile(
                                title: Text(pendingAppointment),
                                leading: Icon(Icons.person_add_alt_1, size: 30,),
                                onTap: () {
                                  print("Horário: " + pendingAppointment);
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
      ),
    );
  }
}
