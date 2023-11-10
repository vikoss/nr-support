import 'package:flutter/foundation.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart';

class HomeViewModel extends ChangeNotifier {

  AuthUseCases _authUseCases;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  HomeViewModel(this._authUseCases);

  logout() {
    _authUseCases.logout.launch();
    print('logout');
  }

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}