import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/current_user_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/login_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/logout_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/register_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/user_session_use_case.dart';

@Injectable()
class AuthUseCases {

  LoginUseCase login;
  CurrentUserUseCase currentUser;
  LogoutUseCase logout;
  RegisterUseCase register;
  UserSessionUseCase user;

  AuthUseCases({
    required this.login,
    required this.currentUser,
    required this.logout,
    required this.register,
    required this.user,
  });
}