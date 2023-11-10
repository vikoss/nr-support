import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/injection.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:nr_soporte_mobile/src/domain/use_cases/user/user_use_cases.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_page.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/register/register_page.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/register/register_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/home/home_page.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/home/home_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/profile/profile_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/color_palette.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  ); */
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => HomeViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => RegisterViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => ProfileViewModel(locator<AuthUseCases>(), locator<UserUseCases>())),
      ],
      child: MaterialApp(
        title: 'Title Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: COLOR_WINE),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'register': (BuildContext context) => RegisterPage(),
          //'tickets/create': (BuildContext context) => RegisterPage(),
        },
      ),
    );
  }
}

