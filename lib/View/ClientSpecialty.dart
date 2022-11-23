import 'package:flutter/material.dart';
import 'package:medfarm/Controller/Statics/ClientSearch.dart';
import 'package:medfarm/View/DoctorClient.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class ClientSpecialty extends StatefulWidget {
  const ClientSpecialty({Key? key}) : super(key: key);

  @override
  State<ClientSpecialty> createState() => _ClientSpecialtyState();
}

class _ClientSpecialtyState extends State<ClientSpecialty> {
  final specialtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 45, bottom: 15),
        child: Column(
          children: <Widget>[
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
            ),
            const Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
                onPressed: () {
                  ClientSearch.setCategory(
                      'Doctor');

                  ClientSearch.setSpecialty(specialtyController.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                  const DoctorClient(),),);
                },
                child: const Text(
                  "Pesquisar",
                  style: TextStyle(
                      color: Color.fromRGBO(
                          3, 153, 186, 1),
                      fontSize: 20),
                ),
              style: ButtonStyle(
                backgroundColor:
                const MaterialStatePropertyAll<
                    Color>(Colors.yellow),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        30.0),
                    side: const BorderSide(
                        width: 3,
                        color: Colors.yellow),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
