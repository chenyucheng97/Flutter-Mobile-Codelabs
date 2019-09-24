import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/core/viewmodels/viewstate.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart' as systemColor;
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: systemColor.backgroundColor,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoginHeader(
                    validationMessage: model.errorMessage,
                    controller: _controller,
                  ),
                  model.state == ViewState.Busy
                      ? CircularProgressIndicator()
                      : FlatButton(
                          color: Colors.white,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            var loginSuccess =
                                await model.login(_controller.text);
                            if (loginSuccess) {
                              Navigator.pushNamed(context, '/');
                            }
                          },
                        )
                ],
              ),
            ));
  }
}
