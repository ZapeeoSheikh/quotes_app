import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Paths/images_url.dart';
import 'package:quotes_app/Utils/colors.dart';
import 'package:quotes_app/View/quotes_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: MediaQuery.of(context).size.width / 1.3,
                  image: AssetImage(splash)),
              SizedBox(
                height: 30,
              ),
              Text("Whispers of Wisdom. Discover yours.",
                  style: GoogleFonts.poorStory(fontSize: 19, color: darkColor)),
              SizedBox(
                height: 5,
              ),
              Text("Beyond words. Unmask your truths.",
                  style: GoogleFonts.poorStory(fontSize: 19, color: darkColor)),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: darkColor,
                    minimumSize: Size(double.infinity, 55)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuoteListPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Inspire me",
                        style: GoogleFonts.montserratAlternates(
                            fontSize: 19, color: lightColor)),
                    Icon(Icons.chevron_right, size: 25, color: lightColor,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
