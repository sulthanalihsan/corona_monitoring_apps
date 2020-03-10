import 'package:coronamonitorapps/commons/colors.dart';
import 'package:coronamonitorapps/commons/sizes.dart';
import 'package:coronamonitorapps/helper/number_helper.dart';
import 'package:coronamonitorapps/provider/corona_provider.dart';
import 'package:coronamonitorapps/screens/detail_screen.dart';
import 'package:coronamonitorapps/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/line_scale_party_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final coronaProvider = Provider.of<CoronaProvider>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          color: ColorPalette.redStart,
          backgroundColor: ColorPalette.blackEnd,
          key: _refreshIndicatorKey,
          onRefresh: coronaProvider.getDataMain,
          child: NotificationListener(
            // ignore: missing_return
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
            },
            child: ListView(
              children: <Widget>[
                HeaderApp('Statistik'),
                SizedBox(
                  height: Sizes.height(context) * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DetailCorona(1)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: Sizes.width(context),
                    height: Sizes.height(context) * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: LinearGradient(
                        colors: [ColorPalette.redStart, ColorPalette.blackEnd],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Terpapar',
                                style: GoogleFonts.poppins(
                                    color: ColorPalette.white,
                                    fontSize: Sizes.dp16(context),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: Sizes.height(context) * 0.018,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                coronaProvider.isFetching
                                    ? Loading(
                                        indicator: LineScalePartyIndicator(),
                                        size: (Sizes.height(context) * 0.17) / 3,
                                        color: ColorPalette.white,
                                      )
                                    : Text(
                                        NumberHelper.format(coronaProvider
                                            .respCorona.confirmed.value
                                            .toString()),
                                        style: GoogleFonts.poppins(
                                            color: ColorPalette.white,
                                            fontSize: Sizes.dp28(context),
                                            fontWeight: FontWeight.w400),
                                      ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text('Orang',
                                    style: GoogleFonts.poppins(
                                        color: ColorPalette.white,
                                        fontSize: Sizes.dp22(context),
                                        fontWeight: FontWeight.w400))
                              ],
                            )
                          ],
                        ),
                        Image.asset('assets/images/biohazard.png')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Sizes.height(context) * 0.02,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DetailCorona(2)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: Sizes.width(context),
                    height: Sizes.height(context) * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: LinearGradient(
                        colors: [ColorPalette.pinkStart, ColorPalette.pinkEnd],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Sembuh',
                                style: GoogleFonts.poppins(
                                    color: ColorPalette.white,
                                    fontSize: Sizes.dp16(context),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: Sizes.height(context) * 0.018,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                coronaProvider.isFetching
                                    ? Loading(
                                        indicator: LineScalePartyIndicator(),
                                        size: (Sizes.height(context) * 0.17) / 3,
                                        color: ColorPalette.white,
                                      )
                                    : Text(
                                        NumberHelper.format(coronaProvider
                                            .respCorona.recovered.value
                                            .toString()),
                                        style: GoogleFonts.poppins(
                                            color: ColorPalette.white,
                                            fontSize: Sizes.dp28(context),
                                            fontWeight: FontWeight.w400),
                                      ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text('Orang',
                                    style: GoogleFonts.poppins(
                                        color: ColorPalette.white,
                                        fontSize: Sizes.dp22(context),
                                        fontWeight: FontWeight.w400))
                              ],
                            )
                          ],
                        ),
                        Image.asset('assets/images/blood.png')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Sizes.height(context) * 0.02,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DetailCorona(3)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: Sizes.width(context),
                    height: Sizes.height(context) * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: LinearGradient(
                        colors: [ColorPalette.brownStart, ColorPalette.brownEnd],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Meninggal',
                                style: GoogleFonts.poppins(
                                    color: ColorPalette.white,
                                    fontSize: Sizes.dp16(context),
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: Sizes.height(context) * 0.018,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                coronaProvider.isFetching
                                    ? Loading(
                                        indicator: LineScalePartyIndicator(),
                                        size: (Sizes.height(context) * 0.17) / 3,
                                        color: ColorPalette.white,
                                      )
                                    : Text(
                                        NumberHelper.format(coronaProvider
                                            .respCorona.deaths.value
                                            .toString()),
                                        style: GoogleFonts.poppins(
                                            color: ColorPalette.white,
                                            fontSize: Sizes.dp28(context),
                                            fontWeight: FontWeight.w400),
                                      ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text('Orang',
                                    style: GoogleFonts.poppins(
                                        color: ColorPalette.white,
                                        fontSize: Sizes.dp22(context),
                                        fontWeight: FontWeight.w400))
                              ],
                            )
                          ],
                        ),
                        Image.asset('assets/images/tengkorak.png')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
