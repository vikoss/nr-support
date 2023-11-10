import 'package:firebase_auth/firebase_auth.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';

abstract class AuthRepository {
  User? get user;
  Future<Resource> login({ required String email, required String password });
  Future<Resource> register(UserModel user);
  Future<void> logout();
}