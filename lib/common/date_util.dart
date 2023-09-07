import 'package:intl/intl.dart';

class DateUtil {
  convertStringFromDate(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return DateFormat('hh:mm a').format(todayDate);
  }

  convertStringFromDateformat(String strDate, String format) {
    DateTime todayDate = DateTime.parse(strDate);
    return DateFormat(format).format(todayDate);
  }

  getDaysOfDate(date) {
    print(date);
    DateTime todayDate = DateFormat("yyyy/MM/dd").parse(date);
    var item = {
      "dayString": DateFormat('EE').format(todayDate),
      "day": todayDate.day
    };
    return item;
  }

  convertStringFromDateObject(DateTime givenDate, String format) {
    DateFormat dateFormat = DateFormat(format);
    String string = dateFormat.format(DateTime.now());
    DateTime givenDate2 = DateTime.parse(string);
    return DateFormat(format).format(givenDate2);
  }

  convertDateNow(DateTime now, String format) {
    String formattedDate = DateFormat(format).format(now);
    return formattedDate;
  }

  isDateGreater(DateTime givenDate, String compareDate) {
    compareDate = convertStringFromDateformat(compareDate, "yyyy-MM-dd");
    String givenDate1 = DateFormat("yyyy-MM-dd").format(givenDate);
    print("compareDate :" + compareDate);
    print("givenDate1 :" + givenDate1);
    DateTime compareDate1 = DateTime.parse(compareDate);
    DateTime givenDate2 = DateTime.parse(givenDate1);
    if (compareDate1.compareTo(givenDate2) == 0) {
      print("Result : greater");
      return true;
    }
    print("Result : lesser");
    return false;
  }

  isDateBetween(
      DateTime givenDate, String compareStartDate, String compareEndDate) {
    compareStartDate =
        convertStringFromDateformat(compareStartDate, "yyyy-MM-dd");
    compareEndDate = convertStringFromDateformat(compareEndDate, "yyyy-MM-dd");
    String givenDate1 = DateFormat("yyyy-MM-dd").format(givenDate);
    print("compareStartDate :" + compareStartDate);
    print("compareEndDate :" + compareEndDate);
    print("givenDate1 :" + givenDate1);
    DateTime compareStartDate1 = DateTime.parse(compareStartDate);
    DateTime compareStartDate2 = DateTime.parse(compareEndDate);
    DateTime givenDate2 = DateTime.parse(givenDate1);
    if (givenDate2.compareTo(compareStartDate1) >= 0 &&
        givenDate2.compareTo(compareStartDate2) <= 0) {
      print("Result : greater");
      return true;
    }
    print("Result : lesser");
    return false;
  }

  List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }
}
