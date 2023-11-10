// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nr_soporte_mobile/src/data/repository/auth_repository_impl.dart'
    as _i16;
import 'package:nr_soporte_mobile/src/data/repository/user_repository_impl.dart'
    as _i13;
import 'package:nr_soporte_mobile/src/di/app_module.dart' as _i18;
import 'package:nr_soporte_mobile/src/di/firebase_service.dart' as _i8;
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart'
    as _i3;
import 'package:nr_soporte_mobile/src/domain/repository/user_repository.dart'
    as _i12;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart'
    as _i4;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/current_user_use_case.dart'
    as _i6;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/login_use_case.dart'
    as _i9;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/logout_use_case.dart'
    as _i10;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/register_use_case.dart'
    as _i11;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/user_session_use_case.dart'
    as _i14;
import 'package:nr_soporte_mobile/src/domain/use_cases/user/get_user_by_id_use_case.dart'
    as _i17;
import 'package:nr_soporte_mobile/src/domain/use_cases/user/user_use_cases.dart'
    as _i15;

const String _repositories = 'repositories';
const String _use_cases = 'use_cases';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(
      () => appModule.authRepository,
      registerFor: {_repositories},
    );
    gh.factory<_i4.AuthUseCases>(
      () => appModule.authUseCases,
      registerFor: {_use_cases},
    );
    gh.factory<_i5.CollectionReference<Object?>>(
        () => appModule.usersCollection);
    gh.factory<_i6.CurrentUserUseCase>(
        () => _i6.CurrentUserUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i7.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i8.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i9.LoginUseCase>(
        () => _i9.LoginUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i10.LogoutUseCase>(
        () => _i10.LogoutUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i11.RegisterUseCase>(
        () => _i11.RegisterUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i12.UserRepository>(
      () => appModule.userRepository,
      registerFor: {_repositories},
    );
    gh.factory<_i12.UserRepository>(
        () => _i13.UserRepositoryImpl(gh<_i5.CollectionReference<Object?>>()));
    gh.factory<_i14.UserSessionUseCase>(
        () => _i14.UserSessionUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i15.UserUseCases>(
      () => appModule.userUseCases,
      registerFor: {_use_cases},
    );
    gh.factory<_i3.AuthRepository>(() => _i16.AuthRepositoryImpl(
          gh<_i7.FirebaseAuth>(),
          gh<_i5.CollectionReference<Object?>>(),
        ));
    gh.factory<_i4.AuthUseCases>(() => _i4.AuthUseCases(
          login: gh<_i9.LoginUseCase>(),
          currentUser: gh<_i6.CurrentUserUseCase>(),
          logout: gh<_i10.LogoutUseCase>(),
          register: gh<_i11.RegisterUseCase>(),
          user: gh<_i14.UserSessionUseCase>(),
        ));
    gh.factory<_i17.GetUserById>(
        () => _i17.GetUserById(gh<_i12.UserRepository>()));
    gh.factory<_i15.UserUseCases>(
        () => _i15.UserUseCases(getById: gh<_i17.GetUserById>()));
    return this;
  }
}

class _$AppModule extends _i18.AppModule {}
