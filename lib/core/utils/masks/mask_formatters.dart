import 'package:brasil_fields/brasil_fields.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatters {
  static MaskFormatters? _instance;

  MaskFormatters._createInstance() {
    _instance = this;
  }

  factory MaskFormatters() => _instance ?? MaskFormatters._createInstance();

  static MaskTextInputFormatter get maskCPF => MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter get maskCNPJ => MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter get maskDate => MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter get maskPhone => MaskTextInputFormatter(
      mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter get maskCEP => MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  MaskTextInputFormatter get maskPercentage =>
      MaskTextInputFormatter(mask: '##,##', filter: {"#": RegExp(r'[0-9]')});
  static CentavosInputFormatter get maskMoney =>
      CentavosInputFormatter(moeda: true);
  static CpfOuCnpjFormatter get maskCpfOrCnpj => CpfOuCnpjFormatter();
}
