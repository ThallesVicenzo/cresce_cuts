// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension StringExtensions on String {
  String clearCpf() {
    return replaceAll('.', '').replaceAll('-', '').replaceAll('/', '').trim();
  }

  String clearCnpj() {
    return replaceAll('.', '').replaceAll('-', '').replaceAll('/', '').trim();
  }

  String clearCPFandCNPJ() {
    return clearCnpj().clearCpf();
  }

  String clearCurrency() => replaceAll(RegExp('[^0-9]'), '');

  String clearZipCode() => replaceAll('-', '');
  String clearBirthDate() => replaceAll('/', '-');

  String formatCpf() {
    return length == 11
        ? '${substring(0, 3)}.${substring(3, 6)}.${substring(6, 9)}-${substring(9, 11)}'
        : this;
  }

  String formatCPFAndCNPJ() {
    if (contains('.') && contains('-')) {
      return this;
    } else if (length == 11) {
      return formatCpf();
    } else if (length == 14) {
      return formatCpnpj();
    } else {
      return this;
    }
  }

  bool isCPF() {
    final value = clearCpf();
    if (value.length == 11) {
      return true;
    } else {
      return false;
    }
  }

  String formatBirthDateOne() {
    return replaceAll('/', '-');
  }

  String formatBirthDateTwo() {
    return replaceAll('-', '/');
  }

  String clearPhoneNumber() {
    return replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll(' ', '');
  }

  String removeDiacritics() {
    String result = this;
    String withDiacritics =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    String withoutDiacritics =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDiacritics.length; i++) {
      result = result.replaceAll(withDiacritics[i], withoutDiacritics[i]);
    }
    return result;
  }

  String toCapitalized() {
    if (trim().isEmpty) return this;
    final split = trim().split(' ');
    final capitalized = split.map((str) {
      if (str.length > 1) {
        return '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}';
      } else {
        return str.toUpperCase();
      }
    }).join(' ');
    return capitalized;
  }

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String initials() {
    final List<String> prepositions = [
      'do',
      'da',
      'de',
      'dos',
      'das',
    ];
    if (trim().isEmpty) return 'DS';
    final names = trim().split(' ');
    names.removeWhere(
        (element) => element.isEmpty || prepositions.contains(element));

    return names.length > 1 ? '${names[0][0]}${names[1][0]}' : names[0][0];
  }

  String formatDateToWeekDay() {
    final date = DateTime.parse(this);
    return DateFormat.EEEE('pt_BR').format(date);
  }

  String formatDataToWeekDay() {
    return DateFormat.yMd('pt_BR').format(DateTime.parse(this));
  }

  String asCurrency() {
    String value = this;
    if (value.contains("R\$")) {
      return this;
    }

    if (value.contains(',') && value.length == 4) {
      value = value.replaceAll('.', '').replaceFirst(',', '.');
    } else if (value.contains(',') && value.length > 4) {
      final commaIndex = value.indexOf(',');
      final dotIndex = value.indexOf('.');
      if (commaIndex > dotIndex) {
        value = value.replaceAll('.', '').replaceAll(',', '.');
      } else {
        value = value.replaceFirst(',', '');
      }
    }
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      return this;
    }
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(doubleValue);
  }

  double currencyToDouble() {
    String value = this;
    if (value.contains("R\$")) {
      value = value.replaceAll("R\$", "");
    }

    if (value.contains(',')) {
      value = value.replaceAll('.', '').replaceFirst(',', '.');
    }
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      return 0.0;
    }
    return doubleValue;
  }

  /// From: 14/06/2021 To 2021-06-14
  String convertDateToServerFormat() {
    if (contains("/") && length == 10) {
      final day = substring(0, 2);
      final month = substring(3, 5);
      final year = substring(6, 10);
      return '$year-$month-$day';
    } else {
      return this;
    }
  }

  String clearSpecialCharacters() {
    final RegExp regex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    return replaceAll(regex, '');
  }

  String formatarNumero() {
    String inicio = substring(0, 2);
    String end = substring(7, 11); // pega os últimos quatro dígitos

    return '$inicio xxxxx $end';
  }

  String formatBankNumber() {
    String lastCharacter = substring(length - 1);
    String remainingCharacters = substring(0, length - 1);

    return "$remainingCharacters-$lastCharacter";
  }

  String formatCpnpj() {
    String part1 = substring(0, 2);
    String part2 = substring(2, 5);
    String part3 = substring(5, 8);
    String part4 = substring(8, 12);
    String part5 = substring(12);

    return '$part1.$part2.$part3/$part4-$part5';
  }

  String hidePhoneNumber() {
    final phone = trim().replaceAll('+', '');
    if (phone.length < 4) {
      return this;
    }

    if (phone.length == 13) {
      final countryNumber = phone[0] + phone[1];
      final ddd = phone[2] + phone[3];
      final lastFourDigits = substring(length - 4);

      return "+$countryNumber $ddd ****-$lastFourDigits";
    }

    if (phone.length == 11) {
      final ddd = phone[0] + phone[1];
      final lastFourDigits = substring(length - 4);

      return "$ddd ****-$lastFourDigits";
    }

    final lastFourDigits = substring(length - 4);
    final obscuredNumber = '*' * (length - 4);

    return "$obscuredNumber-$lastFourDigits";
  }

  String hideAccountNumber() {
    String part1 = substring(6);
    String part2 = substring(7);

    return "***$part1-$part2";
  }

  String hideEmail() {
    List<String> parts = split('@');

    String userName = parts[0];
    String domain = parts[1];

    String part1 = "${userName.substring(0, 1)}****";
    String part2 = "${domain.substring(0, 1)}****";

    return "$part1@$part2.com";
  }
}
