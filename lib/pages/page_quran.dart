import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app_api/services_models/models.dart';
import 'package:quran_app_api/widget/ayatbox.dart';
import 'package:quran_app_api/widget/introbox.dart';

class page_quran extends StatefulWidget {
  List ayat;
  int number;
  String title;
  Surah surah;

  page_quran(this.ayat, this.number, this.title, this.surah);

  @override
  _page_quranState createState() => _page_quranState();
}

class _page_quranState extends State<page_quran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                introbox(widget.surah, widget.title),
                SizedBox(height: 30),
                ListView.separated(
                separatorBuilder: (context,index){
                  return SizedBox(height : 20);
                },
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.ayat.length,
                    itemBuilder: (context, index) {
                      return ayatbox(index, widget.surah, widget.ayat);
                    }),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(widget.title, style: GoogleFonts.poppins()),
          backgroundColor: Colors.deepPurple,
        ));
  }
}
