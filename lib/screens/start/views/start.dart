import 'package:flutter/material.dart';

import '../../../utils/assets.dart';
import '../../../utils/constant/constatnt.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to UpTodo",
                style: Constant.myStyle(
                    fontsize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Please login to your account or create\nnew account to continue',
              style: Constant.myStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(Assets.start),
            Text(
              "What do you want to do Today?",
              style: Constant.myStyle(fontsize: 20),
            ),
            Text(
              "Tap Button to add your tasks",
              style: Constant.myStyle(),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8875FF),
                minimumSize: const Size(390, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'GET STARTED',
                style: Constant.myStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
