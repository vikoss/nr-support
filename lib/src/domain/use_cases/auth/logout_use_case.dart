import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart';

@Injectable()
class LogoutUseCase {

  AuthRepository _repository;
  LogoutUseCase(this._repository);

  launch() => _repository.logout();
}