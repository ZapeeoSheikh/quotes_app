import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Utils/colors.dart';


class QuoteViewPage extends StatefulWidget {
  const QuoteViewPage({Key? key, required this.index}) : super(key: key);
  final int index ;

  @override
  State<QuoteViewPage> createState() => _QuoteViewPageState();
}

class _QuoteViewPageState extends State<QuoteViewPage> {
  bool heart = false;
  List<Icon> bottomNavs = [
    Icon(CupertinoIcons.globe, color: lightColor,),
    Icon(CupertinoIcons.search, color: lightColor,),
    Icon(CupertinoIcons.add_circled, color: lightColor,),
    Icon(CupertinoIcons.heart_fill, color: lightColor,),
    Icon(CupertinoIcons.profile_circled, color: lightColor,),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: darkColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // TODO: Set mainAxisAlignment
            children: [
              ...List.generate(
                bottomNavs.length,
                    (index) => GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // TODO: Animated Bar
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Opacity(
                          opacity: 1, // TODO: Chnage Opacity if not selected
                          child: bottomNavs[index]
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: darkColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.arrow_back,
                            size: 16,
                            color: lightColor,
                          ))),
                  Spacer(),
                  Column(
                    children: [
                      Text("Charchill",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: darkColor,
                          )),
                      Text("@Charchill",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: darkColor,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: darkColor,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/id/237/200/300'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    color: darkColor.withOpacity(0.9), borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("‟",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 150,
                                    color: lightColor.withOpacity(0.1),
                                    // fontWeight: FontWeight.bold
                                  )),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Text("”",
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 150,
                                    color: lightColor.withOpacity(0.1),
                                    // fontWeight: FontWeight.bold
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: lightColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 8.0),
                                  child: Text("Motivation",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        color: darkColor,
                                        // fontWeight: FontWeight.bold
                                      )),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      heart = !heart;
                                    });
                                  },
                                  icon: Icon(
                                    heart ? Icons.favorite : Icons.favorite_border,
                                    color: lightColor.withOpacity(0.8),
                                  ))
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width / 1.6,
                            // color: Colors.red,
                            child: Text("Unleash the power of words. One quote at a time.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.changa(
                                  fontSize: 18,
                                  color: lightColor,
                                )),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
