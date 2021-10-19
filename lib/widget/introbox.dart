import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app_api/services_models/models.dart';

class introbox extends StatelessWidget {
  Surah surah;
  String title;

  introbox(this.surah, this.title);

  String attawbacheck(String x) {
    if (x == "At-Tawba") {
      return "أعوذُ بِٱللَّهِ مِنَ ٱلشَّيۡطَٰنِ ٱلرَّجِيمِ";
    } else {
      return 'بِسْمِ اللَّهِ الرَّحْمَن الرَّحِيم';
    }
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
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(30)),
        height: 200,
        width: 340,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(surah.englishNameTranslation,
                style: GoogleFonts.poppins(fontSize: 22)),
            SizedBox(height: 15),
            Text(
                revType(surah.revelationType) +
                    "     |     " +
                    surah.ayahs.length.toString() +
                    " verses",
                style: GoogleFonts.poppins(fontSize: 15)),
            SizedBox(height: 20),
            Text(attawbacheck(title), style: GoogleFonts.poppins(fontSize: 25))
          ],
        ),
      ),
    );
  }
}
