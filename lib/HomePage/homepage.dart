import 'package:flutter/material.dart';
import 'package:queran_mydrem/Classes/classes.dart';
import 'package:queran_mydrem/Data/data.dart';
import 'package:queran_mydrem/SurahPage/surahpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Surah> surahs = [];

  @override
  void initState() {
    for (int i = 0; i < quranData.length; i++) {
      surahs.add(Surah(
          surahNo: quranData[i]["Surah No"],
          name: quranData[i]["Name"],
          ayats: quranData[i]["Ayats"]));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF4EEE90),
        appBar: AppBar(
          title: Text(
            "Al Quran",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF)),
          ),
          centerTitle: true,
          elevation: 4,
          backgroundColor: Color(0xFF4EEE90),
        ),
        body: Align(
            alignment: Alignment(0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...surahs
                      .map((surah) => Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SurahPage(surah)));
                              },
                              child: Material(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 3,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: MediaQuery.of(context).size.height*0.1,
                                  decoration: BoxDecoration(
                                      color: Color(0xffb5d2be),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.all(20.0),
                                        child: Text(surah.name,style: TextStyle(fontSize: 20),),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.all(20.0),
                                        child: Text("${surah.surahNo}"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList()
                ],
              ),
            )),
      ),
    );
  }
}
