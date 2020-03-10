import 'package:coronamonitorapps/commons/colors.dart';
import 'package:coronamonitorapps/commons/sizes.dart';
import 'package:coronamonitorapps/provider/corona_provider.dart';
import 'package:coronamonitorapps/screens/home_screen.dart';
import 'package:coronamonitorapps/screens/map_screen.dart';
import 'package:coronamonitorapps/screens/more_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoronaProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _layout = [HomeScreen(), MapScreen(), MoreScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layout[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: ColorPalette.grey,
            fontSize: Sizes.dp12(context)),
        unselectedLabelStyle: GoogleFonts.poppins(
            color: ColorPalette.grey, fontSize: Sizes.dp10(context)),
        selectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Image.asset(
                'assets/images/medical.png',
                width: Sizes.width(context) * 0.08,
              ),
            ),
            title: Text(
              "Statistik",
            ),
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset(
                  'assets/images/placeholder.png',
                  width: Sizes.width(context) * 0.08,
                ),
              ),
              title: Text(
                "Peta",
              )),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Image.asset(
                  'assets/images/hospital.png',
                  width: Sizes.width(context) * 0.08,
                ),
              ),
              title: Text(
                "Detail",
              ))
        ],
      ),
    );
  }
}
