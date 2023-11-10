import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/validation_item.dart';

class RegisterState {
  ValidationItem email;
  ValidationItem username;
  ValidationItem password;
  ValidationItem confirmPassword;

  RegisterState({
    this.email = const ValidationItem(),
    this.username = const ValidationItem(),
    this.password = const ValidationItem(),
    this.confirmPassword = const ValidationItem(),
  });

  RegisterState copyWith({
    ValidationItem? username,
    ValidationItem? email,
    ValidationItem? password,
    ValidationItem? confirmPassword,
  }) => RegisterState(
    email: email ?? this.email,
    username: username ?? this.username,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
  );

  toUser() => UserModel(
    email: this.email.value,
    password: this.password.value,
    username: this.username.value,
  );

  bool isValid() {
    // TODO: implement form validation
    return true;
  }
}