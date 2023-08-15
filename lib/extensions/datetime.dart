import 'package:frameworkweather/extensions/string.dart';
import 'package:intl/intl.dart';

extension DateTimeFormatted on DateTime {
  String get formatted {
    String day = DateFormat('d').format(this); // Day of the month
    String month = DateFormat.MMMM('pt_BR')
        .format(this)
        .capitalize(); // Full name of the month
    String hour = DateFormat('HH').format(this); // Hour of the day
    String minute = DateFormat('mm').format(this); // Minute of the hour

    return 'Hoje, $day de $month ${hour}h$minute';
  }
}