import 'package:flutter/material.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class SignUpDrugstore extends StatefulWidget {
  const SignUpDrugstore({Key? key}) : super(key: key);

  @override
  State<SignUpDrugstore> createState() => _SignUpDrugstoreState();
}

class _SignUpDrugstoreState extends State<SignUpDrugstore> {
  final nameController = TextEditingController();
  final cnpjController = TextEditingController();
  final cepController = TextEditingController();
  final numberController = TextEditingController();
  final streetController = TextEditingController();
  final districtController = TextEditingController();
  final complementController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var medFarmWidgetsForm = MedFarmWidgets();

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        child: Scrollbar(
          child: Container(
            padding: EdgeInsets.fromLTRB(17, 30, 17, 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Dados da Farmácia:",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("Nome:"),
                medFarmWidgetsForm.textField(nameController),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("CNPJ:"),
                medFarmWidgetsForm.textField(cnpjController),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Column(
                          children: <Widget>[
                            medFarmWidgetsForm.label("CEP:"),
                            medFarmWidgetsForm.textField(cepController),
                          ],
                        )),
                    const Padding(padding: EdgeInsets.only(right: 15)),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          medFarmWidgetsForm.label("N:"),
                          medFarmWidgetsForm.textField(numberController),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("Rua:"),
                medFarmWidgetsForm.textField(streetController),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("Bairro:"),
                medFarmWidgetsForm.textField(districtController),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("Complemento:"),
                medFarmWidgetsForm.textField(complementController),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Column(
                          children: <Widget>[
                            medFarmWidgetsForm.label("UF:"),
                            medFarmWidgetsForm.textField(stateController),
                          ],
                        )),
                    const Padding(padding: EdgeInsets.only(right: 15)),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          medFarmWidgetsForm.label("Cidade:"),
                          medFarmWidgetsForm.textField(cityController),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("Telefone:"),
                medFarmWidgetsForm.textField(phoneController),
                const Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("E-mail:"),
                medFarmWidgetsForm.textField(emailController),
                const Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.label("Senha:"),
                medFarmWidgetsForm.textFieldPassword(passwordController),
                const Padding(padding: EdgeInsets.all(15)),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Cadastrar",
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
        ),
      ),
    );
  }
}
