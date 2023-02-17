import 'dart:io';

class Validation {
  //이메일 포맷 검증
  String? validateEmail(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return '이메일 형식을 확인해 주세요';
    } else if (value == null || value.isEmpty) {
      return '이메일 입력해 주세요';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}")
            .hasMatch(value)) {
      return '영문, 숫자, 특수문자 조합 8~20자 입력해 주세요';
    } else if (value == null || value.isEmpty) {
      return '비밀번호 입력해 주세요';
    }
    return null;
  }

  String? validateBrithDate(String? value) {
    if (value != null &&
        value.isNotEmpty &&
        !RegExp(r"\b(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])\b")
            .hasMatch(value)) {
      return '형식에 맞춰서 입력해 주세요 ex)19990101';
    } else if (value == null || value.isEmpty) {
      return '생년월일 입력해 주세요';
    }
    return null;
  }

  String? confirmPassword(String? password, String? confirmPassword) {
    if (password != null && password.isNotEmpty) {
      if (confirmPassword != null && confirmPassword.isNotEmpty) {
        if (password != confirmPassword) {
          return '비밀번호가 일치하지 않습니다.';
        } else {
          return null;
        }
      }
    }
    return null;
  }

  Future<bool> isImageUrlValid(String url) async {
    try {
      final response = await HttpClient()
          .getUrl(Uri.parse(url))
          .then((request) => request.close());
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return false;
      }
      if (response.headers.contentType?.value.startsWith('image/') != true) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
