// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nr_soporte_mobile/src/data/repository/auth_repository_impl.dart'
    as _i10;
import 'package:nr_soporte_mobile/src/di/app_module.dart' as _i11;
import 'package:nr_soporte_mobile/src/di/firebase_service.dart' as _i7;
import 'package:nr_soporte_mobile/src/domain/repository/auth_repository.dart'
    as _i3;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart'
    as _i4;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/current_user_use_case.dart'
    as _i5;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/login_use_case.dart'
    as _i8;
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/logout_use_case.dart'
    as _i9;

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
    gh.factory<_i5.CurrentUserUseCase>(
        () => _i5.CurrentUserUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i6.FirebaseAuth>(() => appModule.firebaseAuth);
    await gh.factoryAsync<_i7.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i8.LoginUseCase>(
        () => _i8.LoginUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i9.LogoutUseCase>(
        () => _i9.LogoutUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i3.AuthRepository>(
        () => _i10.AuthRepositoryImpl(gh<_i6.FirebaseAuth>()));
    gh.factory<_i4.AuthUseCases>(() => _i4.AuthUseCases(
          login: gh<_i8.LoginUseCase>(),
          currentUser: gh<_i5.CurrentUserUseCase>(),
          logout: gh<_i9.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i11.AppModule {}
