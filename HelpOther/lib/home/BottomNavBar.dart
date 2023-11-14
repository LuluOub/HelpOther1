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
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        height: 60,
        animationCurve: Curves.easeInOutCubic,



        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        buttonBackgroundColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        key: _NavKey,
        items: [
          Icon((myindex == 0) ? Icons.home  : Icons.home_outlined, color: (myindex == 0)  ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color :Theme.of(context).colorScheme.secondary),
          Icon(Icons.add, color: (myindex == 1)  ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color :Theme.of(context).colorScheme.secondary),
          Icon((myindex == 2) ? Icons.message : Icons.message_outlined, color: (myindex == 2)  ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color :Theme.of(context).colorScheme.secondary),
          Icon((myindex == 3) ? Icons.person : Icons.person_outlined, color: (myindex == 3)  ? Theme.of(context).bottomNavigationBarTheme.selectedIconTheme?.color :Theme.of(context).colorScheme.secondary),
        ],
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