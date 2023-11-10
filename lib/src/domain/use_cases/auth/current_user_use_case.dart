import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart';

@Injectable()
class CurrentUserUseCase {
  AuthRepository _repository;

  CurrentUserUseCase(this._repository);

  User? get session => _repository.user;
}