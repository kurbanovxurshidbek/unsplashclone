import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngdemo16/models/collection_model.dart';
import 'package:ngdemo16/models/photo_model.dart';
import 'package:ngdemo16/models/search_photos_res.dart';
import 'package:ngdemo16/pages/collection_page.dart';
import 'package:ngdemo16/pages/search_page.dart';
import 'package:ngdemo16/services/http_service.dart';
import 'package:ngdemo16/services/log_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _pageController;
  int _currentTap = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Unsplash",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.pix_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          SearchPage(),
          CollectionPage(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTap = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.search,
            size: 32,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.collections,
            size: 32,
          )),
        ],
        onTap: (int index) {
          setState(() {
            _currentTap = index;
          });
          _pageController!.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        currentIndex: _currentTap,
        activeColor: Colors.white,
      ),
    );
  }
}
