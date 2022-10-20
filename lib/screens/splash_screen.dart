import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final Widget child;
  const SplashScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(child);
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => child));
    });

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          /*Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(
              image: AssetImage(
                "assets/icon.png",
              ),
              width: 80,
              height: 80,
            ),
          ),*/
          CircularProgressIndicator(color: Colors.black),
        ],
      ),
    );
  }
}

