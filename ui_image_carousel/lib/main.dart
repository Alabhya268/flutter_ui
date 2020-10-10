import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int photoIndex = 0;
  List photos = [
    'assets/burger1.jpg',
    'assets/burger2.jpg',
    'assets/burger3.jpg',
    'assets/burger4.jpg'
  ];

  void _previousImage() {
    setState(
      () {
        photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
      },
    );
  }

  void _nextImage() {
    setState(
      () {
        photoIndex =
            photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Carousel',
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          photos[photoIndex],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 400,
                    width: 300,
                  ),
                  Positioned(
                    top: 375,
                    left: 25,
                    right: 25,
                    child: SelectedPhoto(
                        numberOfDots: photos.length, photoIndex: photoIndex),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: _previousImage,
                  child: Text(
                    'Previous',
                  ),
                  elevation: 5,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  onPressed: _nextImage,
                  child: Text(
                    'Next',
                  ),
                  elevation: 5,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    ));
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
