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
}