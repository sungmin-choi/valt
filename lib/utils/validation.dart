class Validation {
  //이메일 포맷 검증
  String? validateEmail(String? value) {
    final String result = value.toString();
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(result)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
