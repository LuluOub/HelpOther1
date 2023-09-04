import 'package:flutter/material.dart';
import 'package:helpother/models/user.dart';
import 'package:helpother/screens/register/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:helpother/home/BottomNavBar.dart';

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return AuthenticateScreen();
    } else {
      return menu();
    }
  }
}