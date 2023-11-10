
import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/register/register_state.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier {
  // STATE
  RegisterState _state = RegisterState();
  RegisterState get state => _state;
  Resource _response = Init();
  Resource get response => _response;

  // USECASE
  AuthUseCases _authUseCases;

  RegisterViewModel(this._authUseCases);

  // SETTERS
  void changeEmail(String value) {
    _state = _state.copyWith(email: ValidationItem(value: value));
    notifyListeners();
  }
  void changeUsername(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(username: ValidationItem(value: value, error: null));
    } else {
      _state = _state.copyWith(username: ValidationItem(error: 'Deberia tener al menos 3 caracteres'));
    }
    notifyListeners();
  }
  void changePassword(String value) {
    _state = _state.copyWith(password: ValidationItem(value: value));
    notifyListeners();
  }
  void changeConfirmPassword(String value) {
    _state = _state.copyWith(confirmPassword: ValidationItem(value: value));
    notifyListeners();
  }

  register() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners();
      _response = await _authUseCases.register.launch(_state.toUser());
      notifyListeners();
      print('Email: ${_state.email.value}');
    }
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }
}
