import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_shopapp/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(  
          padding: EdgeInsets.symmetric(horizontal:25.0.w), //symmetric means equal padding and hor means on left and right
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // this makes the whole content at center
            children: [
              Padding(padding: EdgeInsets.all(25.0.r)),

            SizedBox(height: 48.h),
          
            //logo
        
            //title
            Text('Walk Comfy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
            ),
            SizedBox(height: 24.h),
        
            //subtitle
            Text('Feel the premium quality',style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 16.sp,color: Colors.grey),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),

            // shop now button
            GestureDetector( //detects touch gestures
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) =>HomePage(),
                ) 
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[900],borderRadius: BorderRadius.circular(12.r)
                ),
                //border radius circular khalet el button circular
                padding: EdgeInsets.all(25.r),
                child: Center(child: Text('Shop Now',style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.sp),
                  )
                ),
              ),
            )
          ],     
        ),
      ),
      )
    );
  }
}