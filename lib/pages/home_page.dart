import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app_api/pages/page_quran.dart';
import 'package:quran_app_api/services_models/API_Manager.dart';
import 'package:quran_app_api/services_models/models.dart';

class homePage extends StatefulWidget {
  const homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

Future<dynamic> _quranModel;

class _homePageState extends State<homePage> {
  @override
  void initState() {
    _quranModel = API_Manager().getQuran(context);
    super.initState();
  }

  String revType(rev) {
    if (rev == "RevelationType.MECCAN") {
      return "Meccan";
    } else {
      return "Medinan";
    }
  }

  @override
  Widget build(BuildContext context) {
    void openPage(where) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => where));
    }

  

    return Scaffold(
      appBar: AppBar(
        title: Text("Quran App", style: GoogleFonts.poppins()),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: FutureBuilder<dynamic>(
          future:
              DefaultAssetBundle.of(context).loadString('assets/quran.json'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  addAutomaticKeepAlives: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 114,
                  itemBuilder: (context, index) {
                    var surahs = json.decode(snapshot.data.toString());
                    var surahi = QuranModel.fromJson(surahs);
                    var surahwitindex = surahi.data.surahs[index];
                    return ListTile(
                      onTap: () {
                        openPage(page_quran(surahwitindex.ayahs, 1,
                            surahwitindex.englishName, surahwitindex));
                      },
                      title: Text(surahwitindex.englishName,
                          style: GoogleFonts.poppins()),
                      leading: Text((index + 1).toString(),
                          style: GoogleFonts.poppins()),
                      subtitle: Text(
                          revType(surahwitindex.revelationType.toString()),
                          style: GoogleFonts.poppins()),
                      trailing: Text(surahwitindex.name,
                          style: GoogleFonts.poppins()),
                    );
                  });
            } else {
              print(
                DefaultAssetBundle.of(context).loadString('assets/quran.json'),
              );
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
