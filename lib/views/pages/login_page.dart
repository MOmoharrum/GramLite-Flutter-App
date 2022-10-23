import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_data_operation/controllers/login_controller.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _loginController;

  @override
  void initState() {
    _loginController = LoginController(this);
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/logo.png'),
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Gram Lite',
                style: TextStyle(color: Colors.purple, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
              Form(
                  key: _loginController.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                            controller: _loginController.emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == '') {
                                return 'Please Enter your Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Email')),
                      ),
                    ],
                  )),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _loginController.onClickAction();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Login'),
                        )),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
