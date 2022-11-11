import 'calculoDigito.dart';
import 'string_extensions.dart';
import 'dart:developer';

/// Validar [CNPJ]
bool validarCNPJ(String fsDocto,
    {bool fsAjustarTamanho = true, fsExibeDigitoCorreto = false}) {
  String dv1, dv2;
  ACBrCalcDigito modulo = ACBrCalcDigito();
  if (fsAjustarTamanho)
    fsDocto = fsDocto
        .replaceAll('.', '')
        .replaceAll('/', '')
        .replaceAll('-', '')
        .padLeft(14, '0');

  if ((fsDocto.length != 14) || (!fsDocto.strIsNumber())) {
    log('CNPJ deve ter 14 dígitos. (Apenas números)');
    return false;
  }

  if (fsDocto == '0'.padLeft(14)) // Prevenção contra 00000000000000
      {
    log('CNPJ inválido.');
    return false;
  }

  modulo.calculoPadrao();
  modulo.documento = fsDocto.copy(0, 12);
  modulo.calcular();
  dv1 = (modulo.fsDigitoFinal).toString();

  modulo.documento = fsDocto.copy(0, 12) + dv1;
  modulo.calcular();
  dv2 = (modulo.fsDigitoFinal).toString();

  var fsDigitoCalculado = dv1 + dv2;

  if ((dv1 != fsDocto[12]) || (dv2 != fsDocto[13])) {
    var fsMsgErro = 'CNPJ inválido.';
    if (fsExibeDigitoCorreto)
      fsMsgErro = fsMsgErro + '.. Dígito calculado: ' + fsDigitoCalculado;
    log(fsMsgErro);

    return false;
  }
  return true;
}