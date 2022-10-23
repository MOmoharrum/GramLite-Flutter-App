import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data_operation/models/user.dart';
import 'package:flutter_data_operation/services/app_config_service.dart';
import 'package:flutter_data_operation/services/users_service.dart';
import 'package:flutter_data_operation/views/pages/home_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:states_controller/states_controller.dart';

class LoginController extends StatesController {
  List<User>? userList;
  late TextEditingController emailController;
  final formKey = GlobalKey<FormState>();

  LoginController(super.state) {
    emailController = TextEditingController();
  }

  void onClickAction() async {
    if (formKey.currentState!.validate()) {
      userList = (await showFutureLoadingDialog(
              context: context, future: (() => UserServices.getUsers())))
          .result;

      if (userList != null && (userList?.isNotEmpty ?? false)) {
        var result = userList
            ?.where((element) => element.email == emailController.text)
            .toList();

        if (result != null && result.isNotEmpty) {
          AppConfigService.appUser = result.first;
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
        } else {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  title: Text('Wrong Email!!!'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          emailController.clear();
                          Navigator.pop(context);
                        },
                        child: Text('Try Again'))
                  ],
                );
              });
        }
      }
    }
  }
}
