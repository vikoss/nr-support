
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
      buildShowDialog(context);
    } else if (vm.response is Error) {
      print('loginresponses Error');
      final data = vm.response as Error;
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: 'Error: ${data.error}',
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      vm.resetResponse();
    } else if (vm.response is Success) {
      vm.resetResponse();
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    }
  }
}