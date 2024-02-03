import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/assets.dart';
import '../../../utils/constant/constatnt.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int selectedIndex = 0;
  List pages = [
    {
      "img": Assets.path1,
      'text_1': "Manage your tasks",
      'text_2':
          "You can easily manage all of your daily\ntasks in DoMe for free",
    },
    {
      "img": Assets.path2,
      'text_1': "Create daily routine",
      'text_2':
          "In Uptodo  you can create your\npersonalized routine to stay productive",
    },
    {
      "img": Assets.path3,
      'text_1': "Organize your tasks",
      'text_2':
          "You can organize your daily tasks by\nadding your tasks into separate categories",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              itemCount: pages.length,
              onPageChanged: (int page) {
                setState(() {
                  selectedIndex = page;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(pages[index]['img']),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      "${pages[index]['text_1']}",
                      style: Constant.myStyle(
                        color: Colors.black,
                        fontsize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "${pages[index]['text_2']}",
                      textAlign: TextAlign.center,
                      style: Constant.myStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BACK",
                    style: Constant.myStyle(color: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8875FF),
                        minimumSize: const Size(90, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                    child: Text(
                      'NEXT',
                      style: Constant.myStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 4.0,
      width: 26.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // shape: BoxShape.circle,
        color: isActive ? Colors.black : const Color(0XFFDADEEB),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < pages.length; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }
}
