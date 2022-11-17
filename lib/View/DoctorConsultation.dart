import 'package:flutter/material.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DoctorConsultation extends StatefulWidget {
  const DoctorConsultation({Key? key}) : super(key: key);

  @override
  State<DoctorConsultation> createState() => _DoctorConsultationState();
}

class _DoctorConsultationState extends State<DoctorConsultation> {
  bool isChecked = false;
  final dropValue = ValueNotifier('');
  final dropOptions = ["A Vista", "Crédito", "Débito", "PIX"];
  List<String> appointmentsTimeList = ["31/10/2022 08:00",
    "31/10/2022 09:00",
    "31/10/2022 11:00",
    "31/10/2022 12:00",
    "31/10/2022 13:00",
    "31/10/2022 14:00",
    "31/10/2022 15:00",
    "31/10/2022 16:00",
    "31/10/2022 17:00",
    "31/10/2022 18:00",
    "01/11/2022 08:00",
    "01/11/2022 09:00",
    "01/11/2022 10:00",
    "01/11/2022 11:00",
    "01/11/2022 12:00",
    "01/11/2022 13:00",
    "01/11/2022 14:00",
    "01/11/2022 15:00",
    "01/11/2022 16:00",
    "01/11/2022 17:00",
    "01/11/2022 18:00",
    "02/11/2022 08:00",
    "02/11/2022 09:00",
    "02/11/2022 10:00",
    "02/11/2022 11:00",
    "02/11/2022 12:00",
    "02/11/2022 13:00",
    "02/11/2022 14:00",
    "02/11/2022 15:00",
    "02/11/2022 16:00",
    "02/11/2022 17:00",
    "02/11/2022 18:00",
    "03/11/2022 08:00",
    "03/11/2022 09:00",
    "03/11/2022 10:00",
    "03/11/2022 11:00",
    "03/11/2022 12:00",
    "03/11/2022 13:00",
    "03/11/2022 14:00",
    "03/11/2022 15:00",
    "03/11/2022 16:00",
    "03/11/2022 17:00",
    "03/11/2022 18:00"];

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();
    String name = "Flávio Henrique Mdureira Bergamini";
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 45, bottom: 15),
        child: Column(
          children: [
            const Text(
              'Médico',
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
                          medFarmWidgetsForm.TextFieldOutput(
                              "Nome", "Clínico Geral José"),
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
                          Row(
                            children: <Widget>[
                              Text(
                                "Presencial:",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Checkbox(
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Container(
                            //padding: const EdgeInsets.only(right: 166),
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
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      child: const Text("Horários disponíveis:", textAlign: TextAlign.start,),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 17, right: 17),
                      height: 250,
                      child: Container(
                        padding: const EdgeInsets.only(left: 17, right: 17),
                        height: 250,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        child: ListView(
                              children: <Widget>[
                                for(String appointmentTime in appointmentsTimeList)
                                  ListTile(
                                    title: Text(appointmentTime.substring(0, 11),),
                                    subtitle: Text(appointmentTime.substring(11, appointmentTime.length)),
                                    leading: Icon(Icons.access_time_rounded, size: 30,),
                                    onTap: () {
                                      print("Horário: " + appointmentTime);
                                    },
                                  ),
                              ],
                            ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Solicitar",
                        style: TextStyle(
                            color: Color.fromRGBO(3, 153, 186, 1),
                            fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Colors.yellow),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                width: 3, color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
