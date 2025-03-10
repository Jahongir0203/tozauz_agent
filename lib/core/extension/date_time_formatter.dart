import 'package:intl/intl.dart';

extension DateTimeFormatExtension on DateTime {
  // Format DateTime to "dd.MM.yyyy"
  String toDateFormat() {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(this);
  }

  // Format DateTime to "HH:mm"
  String toTimeFormat() {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(this);
  }


  String toCustomUzbekFormat() {
    final monthsUz = [
      "Yanvar", "Fevral", "Mart", "Aprel", "May", "Iyun",
      "Iyul", "Avgust", "Sentabr", "Oktabr", "Noyabr", "Dekabr"
    ];
    String day = DateFormat('dd').format(this); // Extract the day
    String month = monthsUz[this.month - 1];   // Get Uzbek month name
    String time = DateFormat('HH:mm').format(this); // Extract time
    return "$day $month / $time";
  }


}



extension DateTimeFormatter on String {
  /// Parses the string into a DateTime object.
  /// Throws an exception if the string is not in a valid format.
  DateTime toDateTime({String format = 'yyyy-MM-dd'}) {
    final DateFormat parser = DateFormat(format);
    return parser.parse(this);
  }

  /// Formats the string (assumed to be a valid date string) into a custom format.
  String format({String inputFormat = 'yyyy-MM-dd HH:mm', String outputFormat = 'dd MMM yyyy, hh:mm a'}) {
    final DateTime dateTime = toDateTime(format: inputFormat).toLocal();
    final DateFormat formatter = DateFormat(outputFormat);
    return formatter.format(dateTime);
  }

  /// Returns a formatted date string in `dd MMM yyyy` format.
  String get formattedDate {
    return format(outputFormat: 'dd MMM yyyy');
  }

  /// Returns a formatted time string in `hh:mm a` format.
  String get formattedTime {
    return format(outputFormat: 'hh:mm a');
  }

  /// Returns a formatted date and time string in `dd MMM yyyy, hh:mm a` format.
  String get formattedDateTime {
    return format(outputFormat: 'dd MMM yyyy, hh:mm');
  }

  String get toTimeFormat {
    return format(outputFormat: 'HH:mm');
  }


}