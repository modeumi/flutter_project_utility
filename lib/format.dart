import 'package:intl/intl.dart';

String date_to_string_yyMM(String type, dynamic date) {
  DateTime request_date;
  if (date.runtimeType == String) {
    request_date = DateTime.parse(date);
  } else {
    request_date = date;
  }
  String format_date = '';
  if (type == 'kor') {
    format_date = DateFormat("yyyy년 MM월").format(request_date);
  } else if (type == '-') {
    format_date = DateFormat("yyyy-MM").format(request_date);
  }
  return format_date != '' ? format_date : request_date.toString();
}

String date_to_string_yyyyMMdd(String type, dynamic date) {
  DateTime request_date;
  if (date.runtimeType == String) {
    request_date = DateTime.parse(date);
  } else {
    request_date = date;
  }
  String format_date = '';
  if (type == '-') {
    format_date = DateFormat("yyyy-MM-dd").format(request_date);
  } else if (type == '.') {
    format_date = DateFormat("yyyy.MM.dd").format(request_date);
  } else if (type == 'kor') {
    format_date = DateFormat("yyyy년 MM월 dd일").format(request_date);
  } else if (type == 'kor_date') {
    format_date = DateFormat('yyyy년 MM월 dd일 EEEE', 'ko_KR').format(request_date);
  } else if (type == 's.') {
    format_date = DateFormat("yy.MM.dd").format(request_date);
  } else if (type == 'skor') {
    format_date = DateFormat("yy년 MM월 dd일").format(request_date);
  }
  return format_date;
}

String date_to_string_MMdd(String type, DateTime date) {
  try {
    String format_date = '';
    if (type == '-') {
      format_date = DateFormat("MM-dd").format(date);
    } else if (type == 'kor') {
      format_date = DateFormat("M월 d일").format(date);
    } else if (type == 'kor_date') {
      format_date = DateFormat('MM월 dd일 EEEE', 'ko_KR').format(date);
    }
    return format_date;
  } catch (e) {
    print('에러 내용 : $e');
    return date.toString();
  }
}

// String reformat_date(String type, String date) {
//   DateTime format_date = DateTime.parse(date);
//   String format = '';
//   if (type == '.') {
//     format = DateFormat("yyyy.MM.dd").format(format_date);
//   } else if (type == '-') {
//     format = DateFormat("yyyy-MM-dd").format(format_date);
//   } else if (type == 'kor') {
//     format = DateFormat("yy년 MM월 dd일").format(format_date);
//   } else if (type == 's.') {}
//   return format;
// }

dynamic dynamic_to_string_like_pay(dynamic pay) {
  try {
    if (pay is int) {
      String format_pay = NumberFormat('###,###,###,###').format(pay);
      return format_pay;
    } else {
      return pay;
    }
  } catch (e) {
    return pay;
  }
}

String reforme_time_short(String type, String time) {
  final regExp_pattern = RegExp(r'\b\d{2}:\d{2}:\d{2}\b');
  String return_time = time;
  final match_time = regExp_pattern.firstMatch(time);
  String? reform_time = match_time?.group(0);
  if (reform_time != null) {
    if (type == ':') {
      List<String> split_time = reform_time.split(':').sublist(0, 2);
      return_time = split_time.join(':');
    } else if (type == 'kor') {
      List<String> split_time = reform_time.split(':').sublist(0, 2);
      return_time = '${split_time[0]}시${split_time[1]}분';
    } else if (type.contains('m')) {
      List<String> split_time = reform_time.split(':').sublist(0, 2);
      int hour = int.parse(split_time[0]);
      String midnight = '오전';

      if (hour > 12) {
        hour -= 12;
        midnight = '오후';
      } else if (hour == 12) {
        midnight = '오후';
      }

      if (hour == 0) {
        hour = 12;
      }

      if (type == 'mkor') {
        return_time = '$midnight $hour시${split_time[1]}분';
      } else if (type == 'm:') {
        return_time = '$midnight $hour:${split_time[1]}';
      }
    }
  }
  return return_time;
}

DateTime Stringtime_to_Date_defaultday(String time) {
  DateTime now = DateTime.now();
  List<String> split_time = time.split(':');
  try {
    DateTime formatdate = DateTime(now.year, now.month, now.day, int.parse(split_time[0]), int.parse(split_time[1]), int.parse(split_time[2]));
    return formatdate;
  } catch (e) {
    return DateTime(now.year, now.month, now.day, 23, 59, 59);
  }
}

String time_to_string(String type, DateTime date) {
  String return_data = '';
  if (type == 'hmss') {
    return_data = DateFormat('HH:mm:ss SSS').format(date);
  } else if (type == 'hms') {
    return_data = DateFormat('HH:mm:ss').format(date);
  } else if (type == 'hm') {
    return_data = DateFormat('HH:mm').format(date);
  } else if (type == 'ms') {
    return_data = DateFormat('mm:ss').format(date);
  } else if (type == 'mss') {
    return_data = DateFormat('mm:ss SSS').format(date);
  }
  return return_data;
}

String car_number_reform(String number) {
  if (number.length > 4) {
    String reform_data = '${number.substring(0, number.length - 4)}\n${number.substring(number.length - 4)}';
    return reform_data;
  } else {
    return number;
  }
}

String time_calculation(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return '방금 전';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}분 전';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}시간 전';
  } else {
    return date_to_string_yyyyMMdd('.', dateTime);
  }
}

String int_to_unit_string(int count) {
  if (count >= 100000) {
    String unit = '99k+';
    return unit;
  } else if (count >= 1000) {
    int front_unit = (count / 1000).floor();
    var back_unit = ((count % 1000) / 100).floor();
    String unit = '$front_unit.${back_unit}k';
    return unit;
  }
  return count.toString();
}
