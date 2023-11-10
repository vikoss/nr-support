import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/user/get_user_by_id_use_case.dart';

@Injectable()
class UserUseCases {
  GetUserById getById;

  UserUseCases({
    required this.getById,
  });
}