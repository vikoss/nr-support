import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/register/register_response.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/register/register_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/color_palette.dart';
import 'package:nr_soporte_mobile/src/presentation/widgets/default_button.dart';
import 'package:nr_soporte_mobile/src/presentation/widgets/default_textfield.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterViewModel vm = Provider.of<RegisterViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RegisterResponse(context, vm);
    });

    return Scaffold(
      backgroundColor: COLOR_GREY,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              //height: MediaQuery.of(context).size.height * 27,
              height: 200,
              color: COLOR_WINE,
              child: Stack(
                //alignment: Alignment.topLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 32,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/img/logo-nr.png',
                            height: 180,
                            width: 200,
                          ),
                        ],
                      )
                    ]
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
              'Registro',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Nombre de usuario',
              onChanged: (value) {
                vm.changeUsername(value);
              },
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Correo',
              onChanged: (value) {
                vm.changeEmail(value);
              },
              icon: Icons.email_outlined,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Contrasena',
              onChanged: (value) {
                vm.changePassword(value);
              },
              icon: Icons.lock_outline_rounded,
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              label: 'Confirmar contrasena',
              onChanged: (value) {
                vm.changeConfirmPassword(value);
              },
              icon: Icons.lock_outline_rounded,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 40),
            child: DefaultButton(
              label: 'Registrarse',
              onPressed: () {
                vm.register();
              },
            ),
          ),
        ],
      ),
    );
  }
}
