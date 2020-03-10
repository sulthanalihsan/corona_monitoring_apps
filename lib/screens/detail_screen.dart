import 'package:coronamonitorapps/commons/colors.dart';
import 'package:coronamonitorapps/commons/sizes.dart';
import 'package:coronamonitorapps/helper/number_helper.dart';
import 'package:coronamonitorapps/models/response_detail_corona.dart';
import 'package:coronamonitorapps/provider/corona_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indonesia/indonesia.dart';
import 'package:provider/provider.dart';

class DetailCorona extends StatelessWidget {
  final int type;

  DetailCorona(this.type);

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    final coronaProvider = Provider.of<CoronaProvider>(context);
    String title;
    String image;
    Color startColor;
    Color endColor;

    List<ResponseDetailCorona> data;

    switch (type) {
      case 1:
        data = coronaProvider.terpapar;
        title = 'Terpapar';
        image = 'assets/images/biohazard.png';
        startColor = ColorPalette.redStart;
        endColor = ColorPalette.blackEnd;
        break;
      case 2:
        data = coronaProvider.sembuh;
        title = 'Sembuh';
        image = 'assets/images/blood.png';
        startColor = ColorPalette.pinkStart;
        endColor = ColorPalette.pinkEnd;
        break;
      case 3:
        data = coronaProvider.meninggal;
        title = 'Meninggal';
        image = 'assets/images/tengkorak.png';
        startColor = ColorPalette.brownStart;
        endColor = ColorPalette.brownEnd;
        break;
    }

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        coronaProvider.loop = 1;
        if(_controller.text.isNotEmpty){
          coronaProvider.doReset(type);
        }
        return null;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  tanggal(date),
                  style: GoogleFonts.poppins(
                      color: ColorPalette.grey, fontSize: Sizes.dp12(context)),
                ),
              )
            ],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorPalette.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
                coronaProvider.loop = 1;
                if(_controller.text.isNotEmpty){
                  coronaProvider.doReset(type);
                }
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                              color: ColorPalette.grey,
                              fontSize: Sizes.dp16(context)),
                        ),
                      ],
                    ),
                    Image.asset(
                      image,
                      width: Sizes.width(context) * 0.2,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: Sizes.height(context) * 0.07,
                  child: TextField(
                    controller: _controller,
                    cursorColor: ColorPalette.grey,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Cari',
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorPalette.grey,
                        ),
                        fillColor: ColorPalette.greyInput,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none)),
                    onChanged: (String keyword) {
                      coronaProvider.searchItem(keyword, type);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var itemCorona = data[index];
                        var provinsi = itemCorona.provinceState.split(' ');
                        var jumlah;
                        switch (type) {
                          case 1:
                            jumlah = NumberHelper.format(
                                itemCorona.confirmed.toString());
                            break;
                          case 2:
                            jumlah = NumberHelper.format(
                                itemCorona.recovered.toString());
                            break;
                          case 3:
                            jumlah = NumberHelper.format(
                                itemCorona.deaths.toString());
                            break;
                        }

                        return item(
                            context,
                            '${provinsi[0]} ${itemCorona.countryRegion}',
                            '$jumlah Org',
                            startColor,
                            endColor);
                      }),
                )
              ],
            ),
          )),
    );
  }

  Widget item(BuildContext context, String text, String orang, Color startColor,
      Color endColor) {
    return Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(bottom: 5.0),
        width: Sizes.width(context),
        height: Sizes.height(context) * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
            colors: [startColor, endColor],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text,
                style: GoogleFonts.poppins(
                    color: ColorPalette.white, fontSize: Sizes.dp16(context))),
            Text(orang,
                style: GoogleFonts.poppins(
                    color: ColorPalette.white, fontSize: Sizes.dp16(context))),
          ],
        ));
  }
}
