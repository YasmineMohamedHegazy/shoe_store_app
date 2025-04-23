import 'package:flutter/material.dart';
import 'package:shoes_shopapp/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(  
          padding: const EdgeInsets.symmetric(horizontal:25.0), //symmetric means equal padding and hor means on left and right
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // this makes the whole content at center
            children: [
              Padding(padding: EdgeInsets.all(25.0)),

            const SizedBox(height: 48,),
          
          //column is a widget, children is a list of widgets
            //logo
        
            //title
            const Text('Walk Comfy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            const SizedBox(height: 24,),
        
            //subtitle
            const Text('Feel the premium quality',style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 16,color: Colors.grey),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48,),

            //shop now button
            GestureDetector( //detects touch gestures
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) =>HomePage(),
                ) 
                ),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[900],borderRadius: BorderRadius.circular(12)
                ),
                //border radius circular khalet el button circular
                padding: const EdgeInsets.all(25),
                child: const Center(child: const Text('Shop Now',style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
              ),
            )
        
          ],     
        ),
      ),
      )
    );
  }
}