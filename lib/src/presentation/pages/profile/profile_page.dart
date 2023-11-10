import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/profile/profile_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/profile/widgets/profile_content.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewModel vm = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: vm.getUserById(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final response = snapshot.data;

          if (response is Error) {
            final data = response as Error;
            return Center(
              child: Text('Error: ${data.error}'),
            );
          }

          final success = response as Success<UserModel>;

          return ProfileContent(vm, success.data);
        },
      ),
    );
  }
}