import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottNavBar extends StatelessWidget {
  void Function(int)? onTabChange; //for navigation
  BottNavBar ({super.key, required this.onTabChange}); //for navigation

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(color:Colors.grey[400], //to appear as unselected
      activeColor: Colors.grey.shade700, //when it is selected 'hover'
      tabActiveBorder: Border.all(color:Colors.white),
      tabBackgroundColor: Colors.grey.shade100,
      mainAxisAlignment: MainAxisAlignment.center, //makes the navbar at center
      //lw 3ayza l navbar squared tabBorderRadius: 16,
      onTabChange: (value) => onTabChange!(value),
      tabs: const [
        GButton(icon: Icons.home, text: 'Home',),
        GButton(icon: Icons.shopping_bag_rounded, text: 'Cart',)
      
      ]),
    );
  }
}