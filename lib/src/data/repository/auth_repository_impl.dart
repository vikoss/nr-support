import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  FirebaseAuth _firebaseAuth;

  CollectionReference _usersCollection;

  AuthRepositoryImpl(this._firebaseAuth, this._usersCollection);

  @override
  Future<Resource> login({required String email, required String password}) async {
    try {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(data);
    } on FirebaseAuthException catch (error) {
      return Error(error.message ?? 'Error');
    }
  }

  @override
  Future<Resource> register(UserModel user) async {
    try {
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      user.id = data.user?.uid ?? '';
      await _usersCollection.doc(user.id).set(user.toJson());

      return Success(data);
    } on FirebaseAuthException catch (error) {
      return Error(error.message ?? 'Error');
    }
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

}