import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: Container(
                color: Colors.yellow,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BACK",
                    style: myStyle(color: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'NEXT',
                      style: myStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8875FF),
                        minimumSize: Size(90, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle myStyle({Color color = Colors.black}) =>
      GoogleFonts.lato(fontSize: 16, color: color);
}
