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
}
