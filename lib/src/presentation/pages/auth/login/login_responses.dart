
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/login/login_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/show_dialog.dart';

class LoginResponses {
  LoginViewModel vm;
  BuildContext context;

  LoginResponses(this.context, this.vm) {
    if (vm.response is Loading) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        buildShowDialog(context);
      });
    } else if (vm.response is Error) {
      print('loginresponses Error');
      final data = vm.response as Error;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: 'Error: ${data.error}',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3,
        );
        vm.resetResponse();
      });
    } else if (vm.response is Success) {
      vm.resetResponse();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      });
    }
  }
}