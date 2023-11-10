import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/profile/profile_view_model.dart';

class ProfileContent extends StatelessWidget {

  UserModel userModel;
  ProfileViewModel vm;

  ProfileContent(this.vm, this.userModel);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            const Text('ProfilePage'),
            Text(userModel.username),
            Text(userModel.email),
            TextButton(
              onPressed: () async {
                await vm.logout();
                Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
              },
              child: const Text('Cerrar sesion'),
            )
          ],
        ),
      );
  }
}