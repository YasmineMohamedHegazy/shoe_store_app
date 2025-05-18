import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_shopapp/models/shoe.dart';


class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile ({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(left: 25.w),width: 200.w,
    decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(12.r)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      //shoe pic
      ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.asset(shoe.imagepath)),

     //Description
     Padding(
       padding: EdgeInsets.symmetric(horizontal: 25.0.w),
       child: Text(
        shoe.description,
        style: TextStyle(color:Colors.grey[600]),
        ),
     ),

    // price and details
    Padding(
      padding: EdgeInsets.only(left: 12.0.w), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //pushed the plus icon to the end
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //shoe name
              Text(shoe.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),
              overflow: TextOverflow.ellipsis,
              ),
      
              SizedBox(height: 5.h),
              //price
              Text(shoe.price + 'EGP',style: const TextStyle(color: Colors.black),),
              ],
            ),
          ),
              //plus button
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(12.r), 
                  decoration: BoxDecoration(color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(12.r),bottomRight:Radius.circular(12.r)
                    )
                  ),
                    child: const Icon(Icons.add,color: Colors.white,),
                ),
              )
            ],
          ),
        )
      ],
    )
  );
    
  }
}