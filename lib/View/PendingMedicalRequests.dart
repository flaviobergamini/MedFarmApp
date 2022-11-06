import 'package:flutter/material.dart';

class PendingMedicalRequests extends StatefulWidget {
  const PendingMedicalRequests({Key? key}) : super(key: key);

  @override
  State<PendingMedicalRequests> createState() => _PendingMedicalRequestsState();
}

class _PendingMedicalRequestsState extends State<PendingMedicalRequests> {
  List<String> PendingAppointments = [
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 45, bottom: 15),
        child: Column(
          children: [
            const Text(
              'Solicitações Pendentes',
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
                            for (String appointment in PendingAppointments)
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    flex: 2,
                                    child: ListTile(
                                      title: Text(
                                        appointment.substring(
                                            0, appointment.indexOf(';')),
                                      ),
                                      subtitle: Text(appointment.substring(
                                          appointment.indexOf(';') + 1,
                                          appointment.length)),
                                    ),
                                  ),
                                  Flexible(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        print("Horário: " + appointment);
                                        print(
                                            MediaQuery.of(context).size.height);
                                      },
                                      child: Text(
                                        "Confirmar",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(3, 153, 186, 1),
                                            fontSize: 15),
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
                                                width: 3, color: Colors.yellow),
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
      ),
    );
  }
}
