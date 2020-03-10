import 'package:coronamonitorapps/commons/colors.dart';
import 'package:coronamonitorapps/commons/sizes.dart';
import 'package:coronamonitorapps/helper/number_helper.dart';
import 'package:coronamonitorapps/provider/corona_provider.dart';
import 'package:coronamonitorapps/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/line_scale_party_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coronaProvider = Provider.of<CoronaProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderApp('Detail'),
              SizedBox(
                height: Sizes.height(context) * 0.09,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12.0),
                        width: Sizes.width(context) * 0.29,
                        height: Sizes.width(context) * 0.33,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorPalette.redStart,
                              ColorPalette.blackEnd
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: Sizes.width(context) * 0.02,
                            ),
                            Text(
                              'Terpapar',
                              style: GoogleFonts.poppins(
                                  fontSize: Sizes.dp12(context),
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: Sizes.width(context) * 0.03,
                            ),
                            coronaProvider.isFetching
                                ? Loading(
                                    indicator: LineScalePartyIndicator(),
                                    size: 20.0,
                                    color: ColorPalette.white,
                                  )
                                : Text(
                                    NumberHelper.format(coronaProvider
                                        .respCorona.confirmed.value
                                        .toString()),
                                    style: GoogleFonts.poppins(
                                        fontSize: Sizes.dp22(context),
                                        color: Colors.white),
                                  ),
                            Text(
                              'Orang',
                              style: GoogleFonts.poppins(
                                  fontSize: Sizes.dp12(context),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -Sizes.width(context) * 0.13,
                        right: Sizes.width(context) * 0.3 / 7,
                        child: Image.asset(
                          'assets/images/biohazard.png',
                          width: Sizes.width(context) * 0.2,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12.0),
                        width: Sizes.width(context) * 0.29,
                        height: Sizes.width(context) * 0.33,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorPalette.pinkStart,
                              ColorPalette.pinkEnd
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: Sizes.width(context) * 0.02,
                            ),
                            Text(
                              'Sembuh',
                              style: GoogleFonts.poppins(
                                  fontSize: Sizes.dp12(context),
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: Sizes.width(context) * 0.03,
                            ),
                            coronaProvider.isFetching
                                ? Loading(
                                    indicator: LineScalePartyIndicator(),
                                    size: 20.0,
                                    color: ColorPalette.white,
                                  )
                                : Text(
                                    NumberHelper.format(coronaProvider
                                        .respCorona.recovered.value
                                        .toString()),
                                    style: GoogleFonts.poppins(
                                        fontSize: Sizes.dp22(context),
                                        color: Colors.white),
                                  ),
                            Text(
                              'Orang',
                              style: GoogleFonts.poppins(
                                  fontSize: Sizes.dp12(context),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -Sizes.width(context) * 0.13,
                        right: Sizes.width(context) * 0.3 / 7,
                        child: Image.asset(
                          'assets/images/blood.png',
                          width: Sizes.width(context) * 0.2,
                        ),
                      )
                    ],
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12.0),
                        width: Sizes.width(context) * 0.29,
                        height: Sizes.width(context) * 0.33,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorPalette.brownStart,
                              ColorPalette.brownEnd
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: Sizes.width(context) * 0.02,
                            ),
                            Text(
                              'Meninggal',
                              style: GoogleFonts.poppins(
                                  fontSize: Sizes.dp12(context),
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: Sizes.width(context) * 0.03,
                            ),
                            coronaProvider.isFetching
                                ? Loading(
                                    indicator: LineScalePartyIndicator(),
                                    size: 20.0,
                                    color: ColorPalette.white,
                                  )
                                : Text(
                                    NumberHelper.format(coronaProvider
                                        .respCorona.deaths.value
                                        .toString()),
                                    style: GoogleFonts.poppins(
                                        fontSize: Sizes.dp22(context),
                                        color: Colors.white),
                                  ),
                            Text(
                              'Orang',
                              style: GoogleFonts.poppins(
                                  fontSize: Sizes.dp12(context),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -Sizes.width(context) * 0.13,
                        right: Sizes.width(context) * 0.3 / 7,
                        child: Image.asset(
                          'assets/images/tengkorak.png',
                          width: Sizes.width(context) * 0.2,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: Sizes.width(context) * 0.29,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorPalette.redStart,
                            ColorPalette.blackEnd
                          ],
                        ),
                      ),
                      child: Consumer<CoronaProvider>(
                        builder: (context, coronaProvider, _) {
                          if (coronaProvider.isFetching) {
                            return Center(
                              child: Loading(
                                indicator: LineScalePartyIndicator(),
                                size: 30.0,
                                color: ColorPalette.white,
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: coronaProvider?.terpapar?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${coronaProvider.terpapar[index].confirmed} ${coronaProvider.terpapar[index].provinceState} ${coronaProvider.terpapar[index].countryRegion}',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(12.0),
                        width: Sizes.width(context) * 0.29,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorPalette.pinkStart,
                              ColorPalette.pinkEnd
                            ],
                          ),
                        ),
                        child: Consumer<CoronaProvider>(
                          builder: (context, coronaProvider, _) {
                            if (coronaProvider.isFetching) {
                              return Center(
                                child: Loading(
                                  indicator: LineScalePartyIndicator(),
                                  size: 30.0,
                                  color: ColorPalette.white,
                                ),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: coronaProvider?.sembuh?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${coronaProvider.sembuh[index].recovered} ${coronaProvider.sembuh[index].provinceState} ${coronaProvider.sembuh[index].countryRegion}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        )),
                    Container(
                        padding: EdgeInsets.all(12.0),
                        width: Sizes.width(context) * 0.29,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              ColorPalette.brownStart,
                              ColorPalette.brownEnd
                            ],
                          ),
                        ),
                        child: Consumer<CoronaProvider>(
                          builder: (context, coronaProvider, _) {
                            if (coronaProvider.isFetching) {
                              return Center(
                                child: Loading(
                                  indicator: LineScalePartyIndicator(),
                                  size: 30.0,
                                  color: ColorPalette.white,
                                ),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: coronaProvider?.meninggal?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${coronaProvider.meninggal[index].deaths} ${coronaProvider.meninggal[index].provinceState} ${coronaProvider.meninggal[index].countryRegion}',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ))
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
