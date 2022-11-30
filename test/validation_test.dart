// This is a basic Flutter validation test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medfarm/Validation/util.dart';
import 'package:medfarm/Validation/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

   test('validador de CPF falso', () {
    expect(validarCPF('05351151805'), false);
  });

  test('validador de CPF verdadeiro', () {
    expect(validarCPF('05351151804'), true);
  });

  test('validador de CNPJ verdadeiro', () {
    expect(validarCNPJ('08754527000113'), true);
  });

  test('validador de CNPJ Falso', () {
    expect(validarCNPJ('08754527000114'), false);
  });

  test('validador de CPF Falso com letra', () {
    expect(validarCNPJ('05F511g18L5'), false);
  });

  test('validador de CNPJ Falso com letra', () {
    expect(validarCNPJ('D87S4527F001L4'), false);
  });

   test('validador de CPF verdadeiro com pontos', () {
     expect(validarCPF('093.971.430-26'), true);
   });

   test('validador de CNPJ verdadeiro com pontos', () {
     expect(validarCNPJ('03.215.268/0001-39'), true);
   });
}