import 'package:flutter/material.dart';
import 'package:medfarm/Controller/Auth.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var medFarmWidgetsForm = MedFarmWidgets();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
        child: Column(
          children: [
            const Text(
              'Recuperação de senha',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(5)),
                      medFarmWidgetsForm.Label(
                          "Entre com o e-mail utilizado no cadastro"),
                      medFarmWidgetsForm.TextFieldMedFarm(emailController),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton(
                    onPressed: () async {
                      var MedFarmAPIResponse = new Auth();

                      var verify =
                      await MedFarmAPIResponse.sendEmailForgotPassword(
                          emailController.text);

                      print(verify);
                    },
                    child: const Text(
                      "Enviar e-mail",
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
                  const Padding(padding: EdgeInsets.all(15)),
                  medFarmWidgetsForm.Label(
                      "Um e-mail de redefinição de senha será enviado na caixa de entrada do endereço informado"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
