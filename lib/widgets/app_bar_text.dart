import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Center(
      child: RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
            TextSpan(
              text: 'Cloud',
              style: TextStyle(
                //fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 216, 163, 16),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
