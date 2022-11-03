import 'package:flutter/material.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class ClientLoginPage extends StatefulWidget {
  const ClientLoginPage({Key? key}) : super(key: key);

  @override
  State<ClientLoginPage> createState() => _ClientLoginPageState();
}

enum TypeUsers { doctor, drugstore }

class _ClientLoginPageState extends State<ClientLoginPage> {
  TypeUsers? _checkUser = TypeUsers.doctor;

  final cityController = TextEditingController();

  List<String> ListAppointments = [
    "Tainângela Ferreira; Remoto; 31/10/2022 08:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 09:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 11:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 12:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 13:00",
    "Tainângela Ferreira; Remoto; 31/10/2022 14:00"];

  List<String> ListOrders = [
    "Samuel; Remoto; 31/10/2022 08:00",
    "Samuel; Remoto; 31/10/2022 09:00",
    "Samuel; Remoto; 31/10/2022 11:00",
    "Samuel; Remoto; 31/10/2022 12:00",
    "Samuel; Remoto; 31/10/2022 13:00",
    "Samuel; Remoto; 31/10/2022 14:00"];

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
              'Paciente',
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
                          medFarmWidgetsForm.TitleTextLabelBlue(
                              "O que está buscando?"),
                          const Padding(padding: EdgeInsets.all(1)),
                          Row(
                            children: <Widget>[
                              Radio<TypeUsers>(
                                focusColor: Colors.white70,
                                activeColor: Colors.white70,
                                hoverColor: Colors.white70,
                                value: TypeUsers.doctor,
                                groupValue: _checkUser,
                                onChanged: (TypeUsers? value) {
                                  setState(() {
                                    _checkUser = value;
                                  });
                                },
                              ),
                              medFarmWidgetsForm.TextLabelBlue("Médico"),
                              Radio<TypeUsers>(
                                focusColor: Colors.white70,
                                activeColor: Colors.white70,
                                hoverColor: Colors.white70,
                                value: TypeUsers.drugstore,
                                groupValue: _checkUser,
                                onChanged: (TypeUsers? value) {
                                  setState(() {
                                    _checkUser = value;
                                  });
                                },
                              ),
                              medFarmWidgetsForm.TextLabelBlue("Farmácia"),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(1)),
                          medFarmWidgetsForm.TitleTextLabelBlue("Cidade:"),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: medFarmWidgetsForm.TextFieldMedFarm(
                                      cityController)),
                              const Padding(
                                  padding: EdgeInsets.only(right: 10)),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Pesquisar",
                                  style: TextStyle(
                                      color: Color.fromRGBO(3, 153, 186, 1),
                                      fontSize: 20),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(
                                          Colors.yellow),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: const BorderSide(
                                          width: 3, color: Colors.yellow),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
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
                          "Consultas"),
                      Container(
                        height: 150,
                        child: ListView(
                          children: <Widget>[
                            for(String appointment in ListAppointments)
                              ListTile(
                                title: Text(appointment.substring(0, appointment.indexOf(';')),),
                                subtitle: Text(appointment.substring(appointment.indexOf(';') + 1, appointment.length)),
                                leading: Icon(Icons.access_time_rounded, size: 30,),
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
                          "Pedidos"),
                      Container(
                        height: 150,
                        child: ListView(
                          children: <Widget>[
                            for(String order in ListOrders)
                              ListTile(
                                title: Text(order.substring(0, order.indexOf(';')),),
                                subtitle: Text(order.substring(order.indexOf(';') + 1, order.length)),
                                leading: Icon(Icons.access_time_rounded, size: 30,),
                                onTap: () {
                                  print("Horário: " + order);
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
