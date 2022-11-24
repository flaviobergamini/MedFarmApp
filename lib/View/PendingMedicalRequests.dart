import 'package:flutter/material.dart';
import 'package:medfarm/Controller/DoctorController.dart';

class PendingMedicalRequests extends StatefulWidget {
  const PendingMedicalRequests({Key? key}) : super(key: key);

  @override
  State<PendingMedicalRequests> createState() => _PendingMedicalRequestsState();
}

class _PendingMedicalRequestsState extends State<PendingMedicalRequests> {
  List<Map<String, dynamic>> PendingAppointments = [];

  @override
  Widget build(BuildContext context) {
    var DoctorControllerAPI = new DoctorController();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: FutureBuilder<List<dynamic>>(
        future: DoctorControllerAPI.getAppointmentPending(),
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
                  PendingAppointments.clear();
                  List<dynamic> pending = snapshot.data!;

                  pending.forEach((request) {
                    PendingAppointments.add({
                      'id':request['id'],
                      'name':request['name'],
                      'date':request['date']
                    });
                  });

                  return SingleChildScrollView(
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
                                        for (Map<String, dynamic> appointment in PendingAppointments)
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                flex: 2,
                                                child: ListTile(
                                                  title: Text(appointment['name']),
                                                  subtitle: Text(appointment['date']),
                                                ),
                                              ),
                                              Flexible(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    DoctorControllerAPI
                                                        .patchConfirmed(
                                                        appointment['id']);
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
                  );
                }
            }
          }
      ),
    );
  }
}
