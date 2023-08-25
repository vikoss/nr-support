import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_state.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {

  // STATES
  LoginState _state = LoginState();
  Resource _response = Init();

  // GETTERS
  LoginState get state => _state;
  Resource get response => _response;

  // SETTERS
  void changeUsername(String value) {
    _state = _state.copyWith(username: ValidationItem(value: value));
    notifyListeners();
  }
  void changePassword(String value) {
    _state = _state.copyWith(password: ValidationItem(value: value));
    notifyListeners();
  }

  AuthUseCases _authUseCases;
  LoginViewModel(this._authUseCases) {
    print('User session: ${_authUseCases.currentUser.session}');
    final user = _authUseCases.currentUser.session;
    if (user != null) {
      _response = Success(user);
    }
  }

  void login() async {
    print('Username: ${_state.username.value}');
    print('Pwd: ${_state.password.value}');
    _response = Loading();
    print('Data: $_response');
    notifyListeners();
    _response = await _authUseCases.login.launch(
      username: _state.username.value,
      password: _state.password.value
    );
    notifyListeners();
    print('Data: $_response');
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

}