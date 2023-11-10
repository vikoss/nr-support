import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/user/user_use_cases.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';

class ProfileViewModel extends ChangeNotifier {
  AuthUseCases _authUseCases;
  UserUseCases _userUseCases;

  ProfileViewModel(this._authUseCases, this._userUseCases) {
    getUserById();
  }

  logout() async {
    await _authUseCases.logout.launch();
    print('logout');
  }

  Stream<Resource<UserModel>> getUserById() {
    final userId = _authUseCases.user.userSession?.uid ?? '';

    return _userUseCases.getById.launch(userId);
  }

}
