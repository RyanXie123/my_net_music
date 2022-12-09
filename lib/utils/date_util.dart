class DateUtil {
  static String getToday() {
    var now = DateTime.now();
    var day = now.day;
    return day.toString();
  }
}
