import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/View/quotes_view_page.dart';

import '../Services/Controllers/getTag_controller.dart';
import '../Utils/colors.dart';

class QuoteListPage extends StatefulWidget {
  const QuoteListPage({Key? key}) : super(key: key);

  @override
  State<QuoteListPage> createState() => _QuoteListPageState();
}

class _QuoteListPageState extends State<QuoteListPage> {
  bool selection = false;
  List<String> choices = [
    "Whispers of Wisdom. Discover yours.",
    "Quotes that spark. Minds that ignite.",
    "Beyond words. Unmask your truths.",
    "Find your daily dose of inspiration.",
    "Unleash the power of words. One quote at a time.",
    "Your personal library of curated wisdom.",
    "Get quoting! Words to live, laugh, and love by.",
  ];
  TagController tagController = Get.put(TagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        // elevation: 4,
        backgroundColor: lightColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_open_sharp),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Explore",
                style: GoogleFonts.martel(
                    fontSize: 22,
                    color: darkColor,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text("Awesome quotes from our community",
                style: GoogleFonts.martel(
                  fontSize: 12,
                  color: darkColor,
                )),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => tagController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: darkColor,
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: [
                            for (int i = 0;
                                i < tagController.tagsList!.length;
                                i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: FilterChip(
                                  label: Text("${tagController.tagsList![i]}"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelStyle: TextStyle(
                                      color:
                                          selection ? lightColor : darkColor),
                                  backgroundColor: lightColor,
                                  selected: selection,
                                  selectedColor: darkColor,
                                  showCheckmark: false,
                                  onSelected: (value) {
                                    setState(() {
                                      selection = !selection;
                                    });
                                  },
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                ),
                              )
                          ]),
                    ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(choices.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuoteViewPage(index: index)));
                      },
                      child: Card(
                        color: darkColor.withOpacity(0.9),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(4),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: lightColor,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundImage: NetworkImage(
                                          'https://picsum.photos/id/237/200/300'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Container(
                                height: 70,
                                // color: Colors.red,
                                child: Text(choices[index],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.changa(
                                      fontSize: 12,
                                      color: lightColor,
                                    )),
                              ),
                              Spacer(),
                              Text("- Charchill",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.greatVibes(
                                    fontSize: 12,
                                    color: lightColor.withOpacity(0.4),
                                  )),
                            ],
                          ),
                        )),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
