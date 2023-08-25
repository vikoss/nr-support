import 'package:nr_soporte_mobile/src/presentation/utils/validation_item.dart';

class LoginState {
  ValidationItem username;
  ValidationItem password;

  LoginState({
    this.username = const ValidationItem(),
    this.password = const ValidationItem(),
  });

  LoginState copyWith({
    ValidationItem? username,
    ValidationItem? password,
  }) => LoginState(
    username: username ?? this.username,
    password: password ?? this.password,
  );
}