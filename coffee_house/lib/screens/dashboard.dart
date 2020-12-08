
import 'package:coffee_house/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final colorPalette = ColorPalette();
  @override
  
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: screenWidth,
          width: screenWidth,
          color: Colors.transparent,
        ),
        Container(
          height: screenHeight,
          width: screenWidth /5,
          color: colorPalette.leftBarColor,
        ),
        Positioned(
          left: screenWidth / 5,
          child: Container(
            height: screenHeight,
            width: screenWidth - (screenWidth / 5),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 35,
          left: 20,
          child: Icon(
            Feather.menu
          )
        ),
        Positioned(
          top: 35,
          right: 20,
          child: Icon(
            Feather.shopping_bag
          )
        ),
         ],
      ),
    );
  }
}