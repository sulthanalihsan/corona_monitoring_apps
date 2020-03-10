import 'package:coronamonitorapps/models/response_corona.dart';
import 'package:coronamonitorapps/models/response_detail_corona.dart';
import 'package:coronamonitorapps/network/service_corona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoronaProvider with ChangeNotifier {
  CoronaProvider() {
    getDataMain();
    getDetailConfirmed();
    getDetailSpesific();
  }

  ServiceCorona _service = ServiceCorona();
  bool _isFetching;

  bool get isFetching => _isFetching;

  ResponseCorona _respCorona;

  ResponseCorona get respCorona => _respCorona;

  Future<void> getDataMain() async {
    _isFetching = true;
    notifyListeners();
    _respCorona = await _service.getDataMain();
    _isFetching = false;
    notifyListeners();
  }

  Set<Marker> marker = {};

  Future<void> getDetailConfirmed() async {
    _isFetching = true;
    notifyListeners();

    List<ResponseDetailCorona> data = await _service.getDetailCorona();

    data.forEach((item) async {
      marker.add(Marker(
          markerId: MarkerId('${item.lastUpdate}'),
          position: LatLng(item.lat, item.long),
          infoWindow: InfoWindow(
              title:
                  '${item.countryRegion}, Terpapar:${item.confirmed}, Sembuh:${item.recovered}, Meninggal:${item.deaths}'),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(devicePixelRatio: 2.5),
              'assets/images/biohazard_mini.png')));
    });

//    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)

    _isFetching = false;
    notifyListeners();
  }

  List<ResponseDetailCorona> _terpapar;

  List<ResponseDetailCorona> get terpapar => _terpapar;

  List<ResponseDetailCorona> _sembuh;

  List<ResponseDetailCorona> get sembuh => _sembuh;

  List<ResponseDetailCorona> _meninggal;

  List<ResponseDetailCorona> get meninggal => _meninggal;

  Future<void> getDetailSpesific() async {
    _isFetching = true;
    notifyListeners();
    _terpapar = await _service
        .getDetailAllCorona('https://covid19.mathdro.id/api/confirmed');
    _sembuh = await _service
        .getDetailAllCorona('https://covid19.mathdro.id/api/recovered');
    _meninggal = await _service
        .getDetailAllCorona('https://covid19.mathdro.id/api/deaths');
    _isFetching = false;
    notifyListeners();
  }

  List<ResponseDetailCorona> temp = [];

  int loop = 1;

  void searchItem(String keyword, int type) {
    List<ResponseDetailCorona> search = [];

    fiilValue(type);

    if (keyword.isEmpty) {
      search.clear();
      switch (type) {
        case 1:
          _terpapar.clear();
          _terpapar = temp;
          break;
        case 2:
          _sembuh.clear();
          _sembuh = temp;
          break;
        case 3:
          _meninggal.clear();
          _meninggal = temp;
          break;
      }
    } else {
      temp.forEach((item) {
        if (item.countryRegion.toLowerCase().contains(keyword) ||
            item.provinceState.toLowerCase().contains(keyword)) {
          search.add(item);
        }
      });
      loop++;
      switch (type) {
        case 1:
          _terpapar = search;
          break;
        case 2:
          _sembuh = search;
          break;
        case 3:
          _meninggal = search;
          break;
      }
    }
    notifyListeners();
  }

  void fiilValue(int type) {
    if (loop == 1) {
      switch (type) {
        case 1:
          temp = _terpapar;
          break;
        case 2:
          temp = _sembuh;
          break;
        case 3:
          temp = _meninggal;
          break;
      }
    }
  }

  void doReset(int type) {
    switch (type) {
      case 1:
        _terpapar.clear();
        _terpapar = temp;
        break;
      case 2:
        _sembuh.clear();
        _sembuh = temp;
        break;
      case 3:
        _meninggal.clear();
        _meninggal = temp;
        break;
    }
    notifyListeners();
  }
}
