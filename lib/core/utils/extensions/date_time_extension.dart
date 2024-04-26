import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// example : 05 junho 2021
  String get formattedDate => DateFormat('dd MMMM yyyy', 'pt_br').format(this);

  /// example : 14:00:00
  String get formattedTimeWithSeconds =>
      DateFormat('HH:mm:ss', 'pt_br').format(this);

  ///example : 14:00
  String get formattedTime =>
      DateFormat('HH', 'pt_br').format(this).replaceAll(':', 'h');

  /// example : 05 junho 2021, 14:00
  String get formattedDateTime => DateFormat('dd MMMM yyyy, HH:mm', 'pt_br')
      .format(this)
      .replaceAll(':', 'h');

  /// example :  05/06/2021, 14h00
  String get formattedDateTimeWithSlash =>
      DateFormat('dd/MM/yyyy - HH:mm', 'pt_br').format(this);

  /// example :  05/06/2021 às 14h00 BRT
  String get formattedDateTimeWithPreposition =>
      DateFormat('dd/MM/yyyy \'às\' HH:mm \'BRT\'', 'pt_br')
          .format(this)
          .replaceAll(':', 'h');

  String customFormatted(String pattern) =>
      DateFormat(pattern, 'pt_br').format(this);

  /// example : segunda, 01/01
  String get formattedDayAndDate =>
      DateFormat('EEEE, dd/MM', 'pt_br').format(this);

  /// example : 30/12/2021
  String get formattedDayMonthAndYear =>
      DateFormat('dd/MM/yyyy', 'pt_br').format(this);

  /// example : yyyy-MM-dd
  String get formattedYearMouthAndDay =>
      DateFormat('yyyy-MM-dd', 'pt_br').format(this);

  String formatByPattern(String pattern) =>
      DateFormat(pattern, 'pt_br').format(this);

  // Format day of the week
  String get formatWeekday => DateFormat('EEEE', 'pt_br').format(this);

  DateTime get withoutTime => DateTime(year, month, day);

  bool get isFutureDate => isAfter(DateTime.now().withoutTime);

  bool get isTodayDate => day == DateTime.now().day;

  bool isSameYearAndMonth(DateTime date) =>
      year == date.year && month == date.month;
}
