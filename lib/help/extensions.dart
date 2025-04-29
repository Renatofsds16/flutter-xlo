extension StringExtension on String {
  bool isEmailValid(){
    final RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regExp.hasMatch(this);
  }
}