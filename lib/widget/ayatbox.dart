import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app_api/services_models/models.dart';

class ayatbox extends StatefulWidget {
  int index;
  Surah surah;
  List ayat;
  ayatbox(this.index, this.surah, this.ayat);

  @override
  _ayatboxState createState() => _ayatboxState();
}

class _ayatboxState extends State<ayatbox> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              shareplaysave(widget: widget),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(right: 15, left: 15),
                alignment: Alignment.topRight,
                child: Wrap(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 8),
                        child: Text(widget.ayat[widget.index].text,
                            style: GoogleFonts.poppins(fontSize: 20.5)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}

class shareplaysave extends StatelessWidget {
  const shareplaysave({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ayatbox widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 60,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.black26, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: TextButton(
                        onPressed: () {},
                        child: CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: Text((widget.index + 1).toString(),
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                )))))),
            Expanded(flex: 2, child: Container()),
            Expanded(
                flex: 3,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share_outlined,
                              color: Colors.deepPurple)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.play_arrow_outlined,
                              color: Colors.deepPurple)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_add_outlined,
                              color: Colors.deepPurple)),
                      SizedBox(width: 10)
                    ],
                  ),
                )),
          ],
        ));
  }
}
