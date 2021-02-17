class DateUtil {
  static DateTime parse(dynamic date) {
    if (date is DateTime) return date;
    return DateTime.parse(date);
  }
}
