import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart';

@Injectable()
class RegisterUseCase {
  AuthRepository _repository;
  RegisterUseCase(this._repository);

  launch(UserModel user) => _repository.register(user);
}