// This is a basic Flutter validation test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medfarm/Validation/util.dart';
import 'package:medfarm/Validation/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('validador', () {
    expect(validarCPF('05351151805') != '', true);
    expect(validarCPF('05351151804'), '');
    expect(validarCNPJ('08754527000113'), '');
    expect(validarCNPJ('08754527000114') != '', true);
  });

}
