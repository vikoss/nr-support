import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_responses.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/color_palette.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    LoginViewModel vm = Provider.of<LoginViewModel>(context);

    LoginResponses(context, vm);

    return Scaffold(
      backgroundColor: COLOR_GREY,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 250,
              color: COLOR_WINE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/img/logo-nr.png',
                    height: 100,
                    width: 200,
                  ),
                  const Text(
                    'Soporte',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 15),
            child: const Text(
              'Continua con tu',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text(
              'Inicio de sesion',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onChanged: (value) {
                vm.changeUsername(value);
              },
              decoration: const InputDecoration(
                label: Text('Usuario'),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                )
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onChanged: (value) {
                vm.changePassword(value);
              },
              decoration: const InputDecoration(
                label: Text('Contrasena'),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                )
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: ElevatedButton(
              onPressed: () {
                vm.login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: COLOR_WINE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Iniciar sesion',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 40),
            child: const Text(
              'No tienes cuenta?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}