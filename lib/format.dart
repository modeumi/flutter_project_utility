import 'package:intl/intl.dart';

String date_to_string_yyMM(String type, DateTime date) {
  String format_date = '';
  if (type == 'kor') {
    format_date = DateFormat("yyyy년 MM월").format(date);
  } else if (type == '-') {
    format_date = DateFormat("yyyy-MM").format(date);
  }
  return format_date != '' ? format_date : date.toString();
}

String date_to_string_yyyyMMdd(String type, DateTime date) {
  String format_date = '';
  if (type == '-') {
    format_date = DateFormat("yyyy-MM-dd").format(date);
  } else if (type == '.') {
    format_date = DateFormat("yyyy.MM.dd").format(date);
  } else if (type == 'kor') {
    format_date = DateFormat("yyyy년 MM월 dd일").format(date);
  }
  return format_date;
}

String date_to_string_MMdd(String type, DateTime date) {
  try {
    String format_date = '';
    if (type == '-') {
      format_date = DateFormat("M-d").format(date);
    } else if (type == 'kor') {
      format_date = DateFormat("M월 d일").format(date);
    } else if (type == 'kor_date') {
      format_date = DateFormat('MM월 dd일 EEEE', 'ko_KR').format(date);
    }
    return format_date;
  } catch (e) {
    return date.toString();
  }
}

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

String reformat_date(String type, String date) {
  DateTime format_date = DateTime.parse(date);
  String format = '';
  if (type == '.') {
    format = DateFormat("yyyy.MM.dd").format(format_date);
  } else if (type == '-') {
    format = DateFormat("yyyy-MM-dd").format(format_date);
  } else if (type == 'kor') {
    format = DateFormat("yy년 MM월 dd일").format(format_date);
  } else if (type == 's.') {
    format = DateFormat("yy.MM.dd").format(format_date);
  }
  return format;
}

String reforme_time_short(String type, String time) {
  final regExp_pattern = RegExp(r'\b\d{2}:\d{2}:\d{2}\b');
  String return_time = time;
  if (regExp_pattern.hasMatch(time)) {
    if (type == ':') {
      List<String> split_time = time.split(':').sublist(0, 2);
      return_time = split_time.join(':');
    } else if (type == 'kor') {
      List<String> split_time = time.split(':').sublist(0, 2);
      return_time = '${split_time[0]}시${split_time[1]}분';
    } else if (type == 'mkor') {
      List<String> split_time = time.split(':').sublist(0, 2);
      int hour = int.parse(split_time[0]);
      String midnight = '오전';
      if (hour > 12) {
        hour = hour - 12;
        midnight = '오후';
      } else if (hour == 12) {
        midnight = '오후';
      }
      return_time = '$midnight ${split_time[0]}시${split_time[1]}분';
    }
  }
  return return_time;
}

String date_to_String_yyyyMMdddate_Kor_NL(String type, DateTime date) {
  String return_date = '';
  if (type == 'newline') {
    return_date = DateFormat('yyyy년\nMM월 dd일 EEEE', 'ko_KR').format(date);
  } else if (type == 'normal') {
    return_date = DateFormat('yyyy년 MM월 dd일 EEEE', 'ko_KR').format(date);
  }

  return return_date;
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

String time_to_string_HHmmssSSS(DateTime date) {
  String return_date = DateFormat('HH:mm:ss.SSS').format(date);
  return return_date;
}

String time_to_string_HHmmss(DateTime date) {
  String return_date = DateFormat('HH:mm:ss').format(date);
  return return_date;
}

String time_to_string_HHmm(DateTime date) {
  String return_date = DateFormat('HH:mm').format(date);
  return return_date;
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
