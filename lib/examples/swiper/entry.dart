import 'package:flutter/material.dart';

void swiperInit() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiper Demo',
      home: SwiperPage(),
    );
  }
}

class SwiperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwiperPage();
  }
}

class Flip {
  Flip({this.url});
  String url;
}

class _SwiperPage extends State<SwiperPage> {
  int _pageIndex = 0;
  PageController _pageController;
  List<Flip> _flips = <Flip>[
    Flip(url: 'assets/flip/1.jpg'),
    Flip(url: 'assets/flip/2.jpg'),
    Flip(url: 'assets/flip/3.jpg'),
    Flip(url: 'assets/flip/4.jpeg'),
    Flip(url: 'assets/flip/5.jpg'),
    Flip(url: 'assets/flip/6.jpg'),
    Flip(url: 'assets/flip/7.jpg'),
    Flip(url: 'assets/flip/8.jpeg'),
    Flip(url: 'assets/flip/9.jpg'),
    Flip(url: 'assets/flip/10.jpeg'),
    Flip(url: 'assets/flip/11.jpg'),
    Flip(url: 'assets/flip/12.jpg'),
    Flip(url: 'assets/flip/13.jpg'),
    Flip(url: 'assets/flip/14.jpg'),
    Flip(url: 'assets/flip/15.jpg'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );
  }

  Widget _buildItem(int pageIndex, int index) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300),
        height: pageIndex == index ? 500.0 : 500.0,
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Stack(
          children: <Widget>[
            Image.asset(
              _flips[index].url,
              fit: BoxFit.fitWidth,
              width: size.width,
              height: size.height,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 580.0,
            child: PageView.builder(
              itemCount: _flips.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (BuildContext ctx, int index) {
                return _buildItem(_pageIndex, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
