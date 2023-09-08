
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:helpother/home/profile.dart';

import 'CreationDePage.dart';
import 'Discussion.dart';
import 'Homescreen.dart';




class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {




  GlobalKey _NavKey = GlobalKey();

  var PagesAll = [home(),Create(),Discussion(),profile()];

  var myindex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  CurvedNavigationBar(
        backgroundColor: Color(0xFFFCFFFC),

        color: Color(0xFF2541B2),
        key: _NavKey,
        items: [
          Icon((myindex == 0) ? Icons.home  : Icons.home_outlined, color: Colors.white,),
          Icon(Icons.add, color: Colors.white,),
          Icon((myindex == 2) ? Icons.message : Icons.message_outlined, color: Colors.white,),
          Icon((myindex == 3) ? Icons.person : Icons.person_outlined, color: Colors.white,),
        ],
        buttonBackgroundColor: Color(0xFF2541B2),
        onTap: (index){
          setState(() {
            myindex = index;
          });
        },
      ),
      body: PagesAll[myindex],
    );
  }
}