import 'package:flutter/material.dart';
import 'package:medfarm/View/DrugstoreConsultation.dart';

class DrugstoreClient extends StatefulWidget {
  const DrugstoreClient({Key? key}) : super(key: key);

  @override
  State<DrugstoreClient> createState() => _DrugstoreClientState();
}

class _DrugstoreClientState extends State<DrugstoreClient> {
  List<String> ListDrugstores = [
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
              'Farmácias',
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
                            for (String drugstore in ListDrugstores)
                              ListTile(
                                title: Text(drugstore.substring(0, drugstore.indexOf(';')),),
                                subtitle: Text(drugstore.substring(drugstore.indexOf(';') + 1, drugstore.length)),
                                leading: Icon(Icons.add_business, size: 30,),
                                onTap: () {
                                  print("Horário: " + drugstore);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DrugstoreConsultation()),
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
      ),
    );
  }
}
