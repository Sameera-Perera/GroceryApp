import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:groceryapp/models/http_exception.dart';
import 'package:http/http.dart' as http;

class AuthModel with ChangeNotifier {
  String _IdToken = '';
  DateTime _expiresIn = DateTime.now();
  String _localId = '';

  bool get isAuthentication {
    return token.isNotEmpty;
  }

  String get token {
    if (_expiresIn.toString().isNotEmpty &&
        _expiresIn.isAfter(DateTime.now()) &&
        _IdToken.isNotEmpty) {
      return _IdToken;
    }
    return '';
  }

  Future<void> _authentication(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDcu4rC4PGWQmVKNwGVuHbmSVD3fFb-fx8';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true.toString(),
          },
        ),
      );
      final responseData = json.decode(response.body);
      // Bắt các lỗi cần thiết
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      //lấy các giá trị cần thiết từ response trả về
      _IdToken = responseData['idToken'];
      _localId = responseData['localId'];
      _expiresIn = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));

      // cập nhật lại User interface have to do trigger in consumer ở main
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signUp(String email, String password) async {
    return _authentication(email, password, 'signUp');
  }

  Future<void> logIn(String email, String password) async {
    return _authentication(email, password, 'signInWithPassword');
  }
}
