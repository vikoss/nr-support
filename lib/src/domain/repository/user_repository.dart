import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';

abstract class UserRepository {
  Stream<Resource<UserModel>> getUserById(String id);
}