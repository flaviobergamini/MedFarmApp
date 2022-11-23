import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  void ToastMedFarm(var context, String message, bool validation) {
    FToast fToast;

    fToast = FToast();
    fToast.init(context);

    Widget toastOK = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );

    Widget toastError = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );

    if(validation){
      fToast.showToast(
        child: toastOK,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 5),
      );
    }
    else{
      fToast.showToast(
        child: toastError,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 5),
      );
    }
  }
}
