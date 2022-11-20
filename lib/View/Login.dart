import 'package:flutter/material.dart';
import 'package:medfarm/Controller/AuthController.dart';
import 'package:medfarm/View/ClientLoginPage.dart';
import 'package:medfarm/View/DoctorLoginPage.dart';
import 'package:medfarm/View/DrugstoreLoginPage.dart';
import 'package:medfarm/View/ForgotPassword.dart';
import 'package:medfarm/View/SignUp.dart';

import '../Widgets/MedFarmWidgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

enum TypeUsers { client, doctor, drugstore }

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  TypeUsers? _checkUser = TypeUsers.client;

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(6, 45, 6, 6),
        child: Container(
          padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://raw.githubusercontent.com/flaviobergamini/MedFarmAPI/Image/Logo%20MedFarm_op_50.png',
                width: 280.0,
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                children: <Widget>[
                  Radio<TypeUsers>(
                    focusColor: Colors.white70,
                    activeColor: Colors.white70,
                    hoverColor: Colors.white70,
                    value: TypeUsers.client,
                    groupValue: _checkUser,
                    onChanged: (TypeUsers? value) {
                      setState(() {
                        _checkUser = value;
                      });
                    },
                  ),
                  medFarmWidgetsForm.Label("Usuário"),
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
                  medFarmWidgetsForm.Label("Médico"),
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
                  medFarmWidgetsForm.Label("Farmácia"),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              medFarmWidgetsForm.Label("E-mail"),
              medFarmWidgetsForm.TextFieldMedFarm(emailController),
              Padding(padding: EdgeInsets.all(10)),
              medFarmWidgetsForm.Label("Senha"),
              medFarmWidgetsForm.TextFieldPassword(passwordController),
              Padding(padding: EdgeInsets.all(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      var MedFarmAPIResponse = new AuthController();

                       switch(_checkUser){
                         case TypeUsers.client:
                           var verify = await MedFarmAPIResponse.login(emailController.text, passwordController.text, 'Client');
                            print(verify);
                           if (verify == true){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const ClientLoginPage()),
                             );
                           }
                         break;

                         case TypeUsers.doctor:
                           var verify = await MedFarmAPIResponse.login(emailController.text, passwordController.text, 'Doctor');

                           if (verify == true){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const DoctorLoginPage()),
                             );
                           }
                         break;

                         case TypeUsers.drugstore:
                            var verify = await MedFarmAPIResponse.login(emailController.text, passwordController.text, 'Drugstore');

                            if (verify == true){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DrugstoreLoginPage()),
                              );
                            }
                         break;
                       }

                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                          color: Color.fromRGBO(3, 153, 186, 1), fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.yellow),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(width: 3, color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: Text("Esqueci minha senha",
                          style: const TextStyle(color: Colors.white)))
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                      color: Color.fromRGBO(3, 153, 186, 1), fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.yellow),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(width: 3, color: Colors.yellow),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
