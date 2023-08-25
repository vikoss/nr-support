
import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/register/register_state.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterState _state = RegisterState();

  RegisterState get state => _state;


}