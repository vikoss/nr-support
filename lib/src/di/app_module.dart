import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/data/repository/auth_repository_impl.dart';
import 'package:nr_soporte_mobile/src/data/repository/user_repository_impl.dart';
import 'package:nr_soporte_mobile/src/di/firebase_service.dart';
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart';
import 'package:nr_soporte_mobile/src/domain/repository/user_repository.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/current_user_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/login_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/logout_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/register_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/user_session_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/user/get_user_by_id_use_case.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/user/user_use_cases.dart';

@module
abstract class AppModule {

  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @injectable
  CollectionReference get usersCollection => firebaseFirestore.collection('users');

  // @Enviroment custom files
  @Environment('repositories')
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth, usersCollection);

  @Environment('repositories')
  @injectable
  UserRepository get userRepository => UserRepositoryImpl(usersCollection);

  @Environment('use_cases')
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    currentUser: CurrentUserUseCase(authRepository),
    logout: LogoutUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    user: UserSessionUseCase(authRepository),
  );

  @Environment('use_cases')
  @injectable
  UserUseCases get userUseCases => UserUseCases(
    getById: GetUserById(userRepository),
  );
}