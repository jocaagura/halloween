bool validarEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern.toString());
  if (email == "") {
    return false;
  }
  if (regExp.hasMatch(email)) {
    return true;
  }
  return false;
}

double returnMinDouble(double num1, double num2) {
  return num1 < num2 ? num1 : num2;
}
