import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_responses.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/color_palette.dart';
import 'package:nr_soporte_mobile/src/presentation/widgets/default_button.dart';
import 'package:nr_soporte_mobile/src/presentation/widgets/default_textfield.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    LoginViewModel vm = Provider.of<LoginViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      LoginResponses(context, vm);
    });

    return Scaffold(
      backgroundColor: COLOR_GREY,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 220,
              color: COLOR_WINE,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/img/logo-nr.png',
                        height: 200,
                        width: 200,
                      ),
                      // const Text(
                      //   'Soporte',
                      //   style: TextStyle(
                      //     fontSize: 22,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  )
                ]
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
          //const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DefaultTextfield(
              label: 'Correo',
              onChanged: (value) {
                vm.changeEmail(value);
              },
              icon: Icons.email_outlined,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DefaultTextfield(
              onChanged: (value) {
                vm.changePassword(value);
              },
              label: 'Contrasenaa',
              icon: Icons.lock_outline,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: DefaultButton(
              onPressed: () {
                vm.login();
              },
              label: 'Iniciar sesion'
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text(
                'No tienes cuenta?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}