import 'package:flutter/material.dart';

class TextFieldMedFarm {

  Widget avatar(String url) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 60,
        height: 60,
        child: ClipOval(
          child: Image.asset(url),
        ),
      ),
    );
  }

  Widget label(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget textField(TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
