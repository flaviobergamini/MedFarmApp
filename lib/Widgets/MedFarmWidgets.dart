import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedFarmWidgets {
  Widget avatar(String url) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ClipRect(
        child: SvgPicture.asset(
          url,
        ),
      ),
    );
  }

  Widget Label(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget TextFieldOutput(String hint, String text){
    return Container(
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.only(left: 17, right: 17, top: 12, bottom: 12),
        child: Text(hint + ": " + text , style: const TextStyle(fontSize:16),),
      ),
    );
  }

  Widget TextFieldMedFarm(TextEditingController textEditingController) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        autofocus: true,
        obscureText: false,
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
          fillColor: const Color(0xFFD0D6D8),
        ),
      ),
    );
  }

  Widget TextFieldPassword(TextEditingController textEditingController) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        autofocus: true,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
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
          fillColor: const Color(0xFFD0D6D8),
        ),
      ),
    );
  }

  Widget TextLabelBlue(String text){
    return Text(
        text,
        style: TextStyle(
            color: Color.fromRGBO(3, 133, 173, 1.0)));
  }

  Widget TitleTextLabelBlue(String text){
    return Text(
      text,
      style: TextStyle(
          color: Color.fromRGBO(3, 133, 173, 1.0), fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget AlertDialogMedFarm(String title, String message){
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message)
          ],
        ),
      ),
    );
  }
}
