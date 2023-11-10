import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/domain/repository/user_repository.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';

@Injectable()
class GetUserById {
  UserRepository _userRepository;

  GetUserById(this._userRepository);

  Stream<Resource<UserModel>> launch(String id) => _userRepository.getUserById(id);
}