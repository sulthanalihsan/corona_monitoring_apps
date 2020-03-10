import 'package:coronamonitorapps/commons/colors.dart';
import 'package:coronamonitorapps/commons/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indonesia/indonesia.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderApp extends StatelessWidget {
  final String title;

  HeaderApp(this.title);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Image.asset('assets/images/strip.png'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: FlutterLogo(
                          size: 70.0,
                        ),
                        content: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              Text(
                                'Created by Sulthan with Flutter',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Folow Me",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              GestureDetector(
                                  child: Text("Github",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue)),
                                  onTap: () {
                                    launch(
                                        'https://www.github.com/sulthanalihsan');
                                  }),
                              SizedBox(
                                height: 2.0,
                              ),
                              GestureDetector(
                                  child: Text("Instagram",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue)),
                                  onTap: () {
                                    launch(
                                        'https://www.instagram.com/sulthanalihsan');
                                  }),
                              SizedBox(
                                height: 2.0,
                              ),
                              GestureDetector(
                                  child: Text("Linkedin",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue)),
                                  onTap: () {
                                    launch(
                                        'https://www.linkedin.com/in/sulthanalihsan/');
                                  }),
                              SizedBox(
                                height: 2.0,
                              ),
                              GestureDetector(
                                  child: Text("Buy Flutter Merchandise",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue)),
                                  onTap: () {
                                    launch(
                                        'https://www.instagram.com/p/BzkrLmHF_Mn/');
                                  }),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
            Text(
              tanggal(date),
              style: GoogleFonts.poppins(
                  color: ColorPalette.grey, fontSize: Sizes.dp12(context)),
            )
          ],
        ),
        SizedBox(
          height: Sizes.height(context) * 0.03,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
              color: ColorPalette.grey,
              fontSize: Sizes.dp36(context),
              fontWeight: FontWeight.w600),
        ),
        Text(
          'CoronaVirus Monitoring Apps',
          style: GoogleFonts.poppins(
              color: ColorPalette.grey, fontSize: Sizes.dp16(context)),
        ),
      ],
    );
  }
}
