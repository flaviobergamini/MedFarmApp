import 'package:flutter/material.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DrugstoreConsultation extends StatefulWidget {
  const DrugstoreConsultation({Key? key}) : super(key: key);

  @override
  _DrugstoreConsultationState createState() => _DrugstoreConsultationState();
}

class _DrugstoreConsultationState extends State<DrugstoreConsultation> {
  final dropValue = ValueNotifier('');
  final dropOptions = ["A Vista", "Crédito", "Débito", "PIX"];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();
    String name = "Flávio Henrique Mdureira Bergamini";
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
        child: Column(
          children: [
            const Text(
              'Farmácia',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 17, right: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(5)),
                        medFarmWidgetsForm.TextFieldOutput(
                            "Nome", "Drogaria do ZÉ"),
                        const Padding(padding: EdgeInsets.all(5)),
                        medFarmWidgetsForm.TextFieldOutput(
                            "Rua", "Brasiliano Salomon"),
                        const Padding(padding: EdgeInsets.all(5)),
                        medFarmWidgetsForm.TextFieldOutput("Nº", "33"),
                        const Padding(padding: EdgeInsets.all(5)),
                        medFarmWidgetsForm.TextFieldOutput(
                            "Bairro", "Delcides Teles"),
                        const Padding(padding: EdgeInsets.all(5)),
                        medFarmWidgetsForm.TextFieldOutput(
                            "Cidade", "Santa Rita do Sapucaí"),
                        const Padding(padding: EdgeInsets.all(5)),
                        Container(
                          child: ValueListenableBuilder(
                            valueListenable: dropValue,
                            builder: (BuildContext context, String value, _) {
                              return DropdownButtonFormField<String>(
                                hint: const Text(
                                  'Pagamento',
                                  style: TextStyle(color: Colors.black),
                                ),
                                value: (value.isEmpty) ? null : value,
                                onChanged: (choice) =>
                                    dropValue.value = choice.toString(),
                                items: dropOptions
                                    .map(
                                      (op) => DropdownMenuItem(
                                        value: op,
                                        child: Text(op),
                                      ),
                                    )
                                    .toList(),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.5),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Anexar Receita",
                      style: TextStyle(
                          color: Color.fromRGBO(3, 153, 186, 1), fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.yellow),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side:
                              const BorderSide(width: 3, color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Solicitar",
                style: TextStyle(
                    color: Color.fromRGBO(3, 153, 186, 1), fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll<Color>(Colors.yellow),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(width: 3, color: Colors.yellow),
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
