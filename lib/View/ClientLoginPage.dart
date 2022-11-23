import 'package:flutter/material.dart';
import 'package:medfarm/Controller/ClientController.dart';
import 'package:medfarm/Controller/Statics/ClientSearch.dart';
import 'package:medfarm/View/ClientSpecialty.dart';
import 'package:medfarm/View/DrugstoreClient.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class ClientLoginPage extends StatefulWidget {
  const ClientLoginPage({Key? key}) : super(key: key);

  @override
  State<ClientLoginPage> createState() => _ClientLoginPageState();
}

var ClientControllerAPI = new ClientController();

enum TypeUsers { doctor, drugstore }

class _ClientLoginPageState extends State<ClientLoginPage> {
  TypeUsers? _checkUser = TypeUsers.doctor;

  final cityController = TextEditingController();

  Future<List<List<dynamic>>> getLists() async {
    var appointments = await ClientControllerAPI.getAppointment();
    var orders = await ClientControllerAPI.getOrder();

    List<List<dynamic>> lists = <List<dynamic>>[];

    lists.add(appointments);
    lists.add(orders);

    return lists;
  }

  List<String> ListAppointments = [];


  List<String> ListOrders = [];

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();

    ListAppointments.clear();
    ListOrders.clear();

    cityController.text = '';

    return Scaffold(
        backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
        body: FutureBuilder<List<List<dynamic>>>(
          future: getLists(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
                    Text("Carregando Dados", style: TextStyle(color: Colors.white),)
                  ],
                ),);
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
                  List<dynamic> appointments = snapshot.data![0];

                  appointments.forEach((appointment) {
                    String name = appointment['doctor']['name'];
                    String dateTime = appointment['dateTimeAppointment'];

                    String remote;
                    if (appointment['remote'] == true)
                      remote = 'Remoto';
                    else {
                      remote = 'Presencial';
                    }

                    ListAppointments.add('$name; $remote; $dateTime');
                  });

                  List<dynamic> orders = snapshot.data![1];

                  orders.forEach((order) {
                    String name = order['drugstores']['name'];
                    String district = order['drugstores']['district'];
                    String street = order['drugstores']['street'];
                    int streetNumber = order['drugstores']['streetNumber'];
                    ListOrders.add('$name; $district; $street; $streetNumber');
                  });

                  return SingleChildScrollView(
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
                                          medFarmWidgetsForm.TextLabelBlue(
                                              "Médico"),
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
                                          medFarmWidgetsForm.TextLabelBlue(
                                              "Farmácia"),
                                        ],
                                      ),
                                      const Padding(padding: EdgeInsets.all(1)),
                                      medFarmWidgetsForm.TitleTextLabelBlue(
                                          "Cidade:"),
                                      Row(
                                        children: <Widget>[
                                          Flexible(
                                              child: medFarmWidgetsForm
                                                  .TextFieldMedFarm(
                                                      cityController)),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10)),
                                          ElevatedButton(
                                            onPressed: () async {

                                              ClientSearch.setCity(
                                                  cityController.text);

                                              switch (_checkUser) {
                                                case TypeUsers.drugstore:
                                                  ClientSearch.setCategory(
                                                      'Drugstore');
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const DrugstoreClient()),
                                                  );
                                                  break;

                                                case TypeUsers.doctor:
                                                  ClientSearch.setCategory(
                                                      'Doctor');
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ClientSpecialty()),
                                                  );
                                                  break;
                                              }
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
                              padding:
                                  const EdgeInsets.only(left: 17, right: 17),
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
                                        for (String appointment
                                            in ListAppointments)
                                          ListTile(
                                            title: Text(
                                              appointment.substring(
                                                  0, appointment.indexOf(';')),
                                            ),
                                            subtitle: Text(
                                                appointment.substring(
                                                    appointment.indexOf(';') +
                                                        1,
                                                    appointment.length)),
                                            leading: Icon(
                                              Icons.access_time_rounded,
                                              size: 30,
                                            ),
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
                              padding:
                                  const EdgeInsets.only(left: 17, right: 17),
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
                                        for (String order in ListOrders)
                                          ListTile(
                                            title: Text(
                                              order.substring(
                                                  0, order.indexOf(';')),
                                            ),
                                            subtitle: Text(order.substring(
                                                order.indexOf(';') + 1,
                                                order.length)),
                                            leading: Icon(
                                              Icons.access_time_rounded,
                                              size: 30,
                                            ),
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
                  );
                }
            }
          },
        ));
  }
}
