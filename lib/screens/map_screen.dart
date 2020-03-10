import 'package:coronamonitorapps/commons/colors.dart';
import 'package:coronamonitorapps/commons/sizes.dart';
import 'package:coronamonitorapps/provider/corona_provider.dart';
import 'package:coronamonitorapps/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading/indicator/line_scale_party_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  double latitude = -6.1953021;
  double longitude = 106.7947351;

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
            HeaderApp('Peta'),
            SizedBox(
              height: Sizes.height(context) * 0.03,
            ),
            coronaProvider.isFetching
                ? Loading(
                    indicator: LineScalePartyIndicator(),
                    size: 50.0,
                    color: ColorPalette.grey,
                  )
                : Expanded(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(latitude, longitude), zoom: 0.0),
                      mapType: MapType.normal,
                      markers: coronaProvider.marker,
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
