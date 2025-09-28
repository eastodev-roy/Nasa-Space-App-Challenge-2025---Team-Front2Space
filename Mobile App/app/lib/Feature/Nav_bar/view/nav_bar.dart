import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../UI/Home_page/view/home_page.dart';

class NavBar extends StatelessWidget {
   NavBar({super.key});
  int index =0;
  final screen=[
    HomePage(),
    SearchPage(),
    FavoritePage(),
    FavoritePage(),
    FavoritePage(),

  ];
   @override
  Widget build(BuildContext context) {


    final items = <Widget>[
      const Icon(Icons.home, size: 30,color: Colors.blueAccent,),
      const Icon(Icons.search, size: 30,color: Colors.blueAccent,),
      const Icon(Icons.favorite, size: 30,color: Colors.blueAccent,),
      const Icon(Icons.safety_check, size: 30,color: Colors.blueAccent,),
      const Icon(Icons.settings, size: 30,color: Colors.blueAccent,),
    ];

    return Container(
      color: Colors.tealAccent.withOpacity(0.05),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.cyanAccent,

        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.tealAccent.withOpacity(0.05),
          backgroundColor: Colors.transparent,

          items: items,
          height: 60,
          index: index, // Default active tab
          onTap: (i) {

          },
        ),
        body: screen[index],
        // body:Image.asset('assets/shark2.jpg',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
      ),
    );
  }
}


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}

