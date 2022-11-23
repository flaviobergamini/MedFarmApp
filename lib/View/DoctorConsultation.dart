import 'package:flutter/material.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/Controller/ClientController.dart';
import 'package:medfarm/Controller/Statics/Utils.dart';
import 'package:medfarm/Model/Requests/ClientAppointmentRequestModel.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class DoctorConsultation extends StatefulWidget {
  const DoctorConsultation({Key? key}) : super(key: key);

  @override
  State<DoctorConsultation> createState() => _DoctorConsultationState();
}

var clientControllerAPI = ClientController();

class _DoctorConsultationState extends State<DoctorConsultation> {
  bool isChecked = false;
  final dropValue = ValueNotifier('');
  final dropOptions = ["A Vista", "Crédito", "Débito", "PIX"];
  List<String> appointmentsTimeList = [];

  Future<List<Map>> getMaps() async {
    var appointments =
        await clientControllerAPI.getDoctorById(Utils.getDoctorId);
    var orders = await clientControllerAPI
        .getAppointmentFreeDateTimeByDoctorId(Utils.getDoctorId);

    List<Map> lists = [];

    lists.add(appointments);
    lists.add(orders);

    return lists;
  }

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();

    String name;
    String street;
    String streetNumber;
    String district;
    String city;
    String selectedDateTime = '';

    return Scaffold(
        backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
        body: FutureBuilder<List<Map>>(
            future: getMaps(),
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
                    name = snapshot.data![0]['name'];
                    street = snapshot.data![0]['street'];
                    streetNumber = '${snapshot.data![0]['streetNumber']}';
                    district = snapshot.data![0]['district'];
                    city = snapshot.data![0]['city'];

                    appointmentsTimeList.clear();

                    List<dynamic> appointments =
                        snapshot.data![1]['appointmentDateTimePending'];

                    appointments.forEach((dateTime) {
                      String appointment = dateTime;
                      appointmentsTimeList.add(appointment);
                    });

                    return SingleChildScrollView(
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
                          const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5)),
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
                                    padding: const EdgeInsets.only(
                                        left: 17, right: 17),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        medFarmWidgetsForm.TextFieldOutput(
                                            "Nome", name),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        medFarmWidgetsForm.TextFieldOutput(
                                            "Rua", street),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        medFarmWidgetsForm.TextFieldOutput(
                                            "Nº", streetNumber),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        medFarmWidgetsForm.TextFieldOutput(
                                            "Bairro", district),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        medFarmWidgetsForm.TextFieldOutput(
                                            "Cidade", city),
                                        const Padding(
                                            padding: EdgeInsets.all(5)),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Presencial:",
                                              style:
                                                  const TextStyle(fontSize: 16),
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
                                            builder: (BuildContext context,
                                                String value, _) {
                                              return DropdownButtonFormField<
                                                  String>(
                                                hint: const Text(
                                                  'Pagamento',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                value: (value.isEmpty)
                                                    ? null
                                                    : value,
                                                onChanged: (choice) => dropValue
                                                    .value = choice.toString(),
                                                items: dropOptions
                                                    .map(
                                                      (op) => DropdownMenuItem(
                                                        value: op,
                                                        child: Text(op),
                                                      ),
                                                    )
                                                    .toList(),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white
                                                      .withOpacity(0.5),
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
                                    padding: const EdgeInsets.only(
                                        left: 17, right: 17),
                                    child: const Text(
                                      "Horários disponíveis:",
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 17, right: 17),
                                    height: 250,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 17, right: 17),
                                      height: 250,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25)),
                                      ),
                                      child: ListView(
                                        children: <Widget>[
                                          for (String appointmentTime
                                              in appointmentsTimeList)
                                            ListTile(
                                              title: Text(
                                                appointmentTime.substring(
                                                    0, 11),
                                              ),
                                              subtitle: Text(
                                                  appointmentTime.substring(11,
                                                      appointmentTime.length)),
                                              leading: Icon(
                                                Icons.access_time_rounded,
                                                size: 30,
                                              ),
                                              onTap: () {
                                                selectedDateTime =
                                                    appointmentTime;
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(5)),
                                  ElevatedButton(
                                    onPressed: () async {
                                      String day =
                                          selectedDateTime.substring(0, 2);
                                      String month =
                                          selectedDateTime.substring(3, 5);
                                      String year =
                                          selectedDateTime.substring(6, 10);

                                      String date = '$year-$month-$day';
                                      String time = selectedDateTime.substring(
                                          selectedDateTime.indexOf(' ') + 1,
                                          selectedDateTime.length);

                                      String RequestAppointment =
                                          '${date}T${time}:00.000Z';

                                      var clientAppointmentRequest =
                                          ClientAppointmentRequestModel(
                                              RequestAppointment,
                                              !isChecked,
                                              '',
                                              dropValue.value,
                                              AuthController.userId,
                                              Utils.getDoctorId);

                                      var response = await clientControllerAPI.postAppointmentClient(clientAppointmentRequest);

                                      print(response);
                                    },
                                    child: const Text(
                                      "Solicitar",
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
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
                    );
                  }
              }
            }));
  }
}
