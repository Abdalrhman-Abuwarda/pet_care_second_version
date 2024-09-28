import 'package:intl/intl.dart';

extension TimeExtension on String {
  DateTime _parse() => DateTime.parse(this);

  String convertToTime12() => DateFormat.jm().format(_parse());

  String convertToTime24() => DateFormat.Hm().format(_parse());

  String convertToDate() => DateFormat.MMMd().format(_parse());

  String convertToMinute() => DateFormat.Hm().format(_parse());

  String convertToFullDate() => DateFormat.yMMMd().format(_parse());

  String differenceDay() {
    final difference = DateTime.now().difference(_parse()).inDays;
    if (difference == 0) return "Today";
    if (difference == 1) return "Yesterday";
    return "$difference Days ago";
  }

  String differenceHour() {
    final hours = DateTime.now().difference(_parse()).inHours;
    return "$hours Hours ago";
  }
}