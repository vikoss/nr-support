import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart';

@Injectable()
class LoginUseCase {

  AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  launch({
    required String email,
    required String password,
  }) => _authRepository.login(
    email: email,
    password: password,
  );
}