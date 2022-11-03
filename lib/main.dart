import 'package:flutter/material.dart';
import 'package:medfarm/View/ClientLoginPage.dart';
import 'package:medfarm/View/DoctorLoginPage.dart';
import 'package:medfarm/View/DrugstoreConsultation.dart';
import 'package:medfarm/View/Login.dart';
import 'package:medfarm/View/Order.dart';
import 'View/DoctorConsultation.dart';


void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorLoginPage(),
      theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: const Color.fromRGBO(3, 153, 186, 1),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}
