import 'package:flutter/material.dart';

import 'package:new_art/src/features/auth/presentation/widgets/login_widget.dart';
import 'package:new_art/src/features/auth/presentation/widgets/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginWidget(onClickedSignUp: toggle)
        : SignUpWidget(onClickedSignUp: toggle);
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
