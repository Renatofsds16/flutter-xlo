import 'package:intl/intl.dart';

extension StringExtension on String {
  bool isEmailValid() {
    final RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regExp.hasMatch(this);
  }
}

extension DateTimeExtension on DateTime {
  String formatedDate() {
    return DateFormat('dd/MM/yyyy HH/mm', 'pt-BR').format(this);
  }
}
