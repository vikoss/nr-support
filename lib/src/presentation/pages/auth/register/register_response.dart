import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';
import 'package:nr_soporte_mobile/src/presentation/pages/auth/register/register_view_model.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/show_dialog.dart';

class RegisterResponse {
  BuildContext context;
  RegisterViewModel vm;

  RegisterResponse(this.context, this.vm) {
    if (vm.response is Loading) {
      buildShowDialog(context);
    }
    if (vm.response is Error) {
      final data = vm.response as Error;
      Fluttertoast.showToast(
        msg: data.error,
        timeInSecForIosWeb: 3,
        toastLength: Toast.LENGTH_LONG,
      );
      vm.resetResponse();
    }
    if (vm.response is Success) {
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    }
  }
}