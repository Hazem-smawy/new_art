import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:newart/src/features/auth/presentation/pages/verify_page.dart';

import 'package:newart/src/features/auth/presentation/widgets/login_widget.dart';
import 'package:newart/src/features/auth/presentation/widgets/sign_up_widget.dart';

class AuthMainPage extends StatelessWidget {
  const AuthMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}

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
