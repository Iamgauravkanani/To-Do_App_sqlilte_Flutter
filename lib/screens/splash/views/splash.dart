import 'package:flutter/material.dart';
import '../../../utils/assets.dart';
import '../../../utils/constant/constatnt.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, 'intro');
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.splash),
            const SizedBox(
              height: 20,
            ),
            Text(
              "UpTodo",
              style:
                  Constant.myStyle(fontsize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
