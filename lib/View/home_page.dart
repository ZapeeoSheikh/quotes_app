import 'package:flutter/material.dart';
import 'package:quotes_app/Paths/images_url.dart';
import 'package:quotes_app/Utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: MediaQuery.of(context).size.width/1.3,
                image: AssetImage(splash))
          ],
        ),
      ),
    );
  }
}
