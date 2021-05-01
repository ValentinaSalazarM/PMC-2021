DateTime? dateTimeFromString(String? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return DateTime.tryParse(dateTime);
}

DateTime? fromDDMMYYToDateTime(String? dateString) {
  if (dateString == null) {
    return null;
  }
  DateTime now = DateTime.now();
  List<String> descomposedTime =
      dateString.replaceAll(RegExp('[\\AM|\\PM]'), '').split(' ');
  String subYear = now.year.toString().substring(0, 2);
  String _date = descomposedTime[0].split('/').reversed.join('-');
  String date = '${descomposedTime[0].length <= 8 ? subYear : ''}$_date';
  return DateTime.tryParse('$date ${descomposedTime[1]}');
}

// String? formatDDMMYYWithTime(DateTime? date) {
//   if (date == null) {
//     return null;
//   }
//   return DateFormat('dd/MM/yy h:mm a', 'en_US').format(date);
// }

// String? formatDDMMYY(DateTime? date) {
//   if (date == null) {
//     return null;
//   }
//   return DateFormat('dd/MM/yy', 'en_US').format(date);
// }

// String? formatMMMMYY(DateTime? date) {
//   if (date == null) {
//     return null;
//   }
//   return DateFormat('MMMM yyyy', 'es').format(date);
// }

// String? fromDDMMYYToYYMMDD(String? date) {
//   DateFormat inputFormat = DateFormat('dd/MM/yyyy');
//   DateTime date1 = inputFormat.parse(date);

//   DateFormat outputFormat = DateFormat('yyyy-MM-dd');
//   return outputFormat.parse(date1.toString()).toString();
// }
