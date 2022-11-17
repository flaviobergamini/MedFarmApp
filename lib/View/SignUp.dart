import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medfarm/View/SignUpClient.dart';
import 'package:medfarm/View/SignUpDrugstore.dart';
import 'package:medfarm/View/SingUpDoctor.dart';
import 'package:medfarm/Widgets/MedFarmWidgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var medFarmWidgets = MedFarmWidgets();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 17, 17, 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Desejo cadastrar:",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpClient()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  medFarmWidgets.avatar('assets/Client.svg'),
                  const Padding(padding: EdgeInsets.only(right: 15)),
                  const Text(
                    "Cliente",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpDoctor()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //medFarmWidgets.avatar('assets/Medical Doctor.svg'),
                  Container(
                    width: 75,
                    height: 75,
                    child: Image.asset('assets/Medical Doctor.png'),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 15)),
                  const Text(
                    "Médicos",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpDrugstore()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  medFarmWidgets.avatar('assets/Drugstore.svg'),
                  const Padding(padding: EdgeInsets.only(right: 15)),
                  const Text(
                    "Farmácia",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
