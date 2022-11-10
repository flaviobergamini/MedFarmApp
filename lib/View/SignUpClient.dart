import 'package:flutter/material.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class SignUpClient extends StatefulWidget {
  const SignUpClient({Key? key}) : super(key: key);

  @override
  State<SignUpClient> createState() => _SignUpClientState();
}

class _SignUpClientState extends State<SignUpClient> {
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
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
                  "Dados de Cliente:",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("Nome:"),
                medFarmWidgetsForm.TextFieldMedFarm(nameController),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("CPF:"),
                medFarmWidgetsForm.TextFieldMedFarm(cpfController),
                if(CPFValidator.isValid(cpfController.toString(),false))
                  medFarmWidgetsForm.Label("CPF inaválido!"),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Column(
                      children: <Widget>[
                        medFarmWidgetsForm.Label("CEP:"),
                        medFarmWidgetsForm.TextFieldMedFarm(cepController),
                      ],
                    )),
                    const Padding(padding: EdgeInsets.only(right: 15)),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          medFarmWidgetsForm.Label("N:"),
                          medFarmWidgetsForm.TextFieldMedFarm(numberController),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("Rua:"),
                medFarmWidgetsForm.TextFieldMedFarm(streetController),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("Bairro:"),
                medFarmWidgetsForm.TextFieldMedFarm(districtController),
                Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("Complemento:"),
                medFarmWidgetsForm.TextFieldMedFarm(complementController),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Column(
                      children: <Widget>[
                        medFarmWidgetsForm.Label("UF:"),
                        medFarmWidgetsForm.TextFieldMedFarm(stateController),
                      ],
                    )),
                    const Padding(padding: EdgeInsets.only(right: 15)),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          medFarmWidgetsForm.Label("Cidade:"),
                          medFarmWidgetsForm.TextFieldMedFarm(cityController),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("Telefone:"),
                medFarmWidgetsForm.TextFieldMedFarm(phoneController),
                const Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("E-mail:"),
                medFarmWidgetsForm.TextFieldMedFarm(emailController),
                const Padding(padding: EdgeInsets.all(10)),
                medFarmWidgetsForm.Label("Senha:"),
                medFarmWidgetsForm.TextFieldPassword(passwordController),
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
