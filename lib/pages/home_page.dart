import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_shopapp/components/bottom_nav_bar.dart';
import 'package:shoes_shopapp/pages/cart_page.dart';
import 'package:shoes_shopapp/pages/home_page2.dart';
import 'package:shoes_shopapp/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State <HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex=0;
  //the following navigates on navbar when user tabs
  void navigateBottomBar(int index) { //a custom function that is called later
    setState(() {
      _selectedIndex=index;
    });
  }

  //pages to display
  final List<Widget> _pages= [
    //home page
    const HomePage2(),
    //cart page
    const CartPage(),
  ];

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottNavBar(
        onTabChange: (index) => navigateBottomBar(index) , //for navigation
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) =>
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {Scaffold.of(context).openDrawer();}, //opens the drawer
        ),
      ),
    ),
    //here i call the drawer so the white blank for the side menu appeared
      drawer: Drawer(backgroundColor: Colors.white,
      child: Column(
        children: [
        SizedBox(height: 60.h),
        
       //other pages
       Padding(
         padding: EdgeInsets.only(left: 25.0.w),
         child: ListTile(leading: Icon(Icons.home,color: Colors.black,),title: Text('Home',style: TextStyle(
          color: Colors.black
         ),
        )
      ),
    ),

       Padding(
         padding: EdgeInsets.only(left: 25.0.w),
         child: ListTile(leading: Icon(Icons.shop,color: Colors.black,),title: Text('Shop',style: TextStyle(
          color: Colors.black
         ),),
         onTap: () {
          Navigator.pop(context); //closes the drawer
          Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage()));
         } 
         ,),
       ),

       Padding(
         padding: EdgeInsets.only(left: 25.0.w),
         child: ListTile(leading: Icon(Icons.info,color: Colors.black,),title: Text('About',style: TextStyle(
          color: Colors.black
         ),
        )
      ),
    ),

       Padding(
         padding: EdgeInsets.only(left: 25.0.w),
         child: ListTile(leading: Icon(Icons.logout,color: Colors.black,),title: Text('Logout',style: TextStyle(
          color: Colors.black
         ),
        )
      ),
    )
      ],
    ),
  ), 
      body: _pages [_selectedIndex], //it changes the page when a user tap a button
    );
  }
}