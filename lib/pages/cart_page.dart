import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopapp/components/cart_item.dart';
import 'package:shoes_shopapp/pages/address_page.dart';
import '../models/cart.dart';
import '../models/shoe.dart';


class CartPage extends StatelessWidget {
  const CartPage ({super.key});

  @override
  Widget build (BuildContext context) {
    return Consumer<Cart> (builder:(context, value, child) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Text('My Cart',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),),
          SizedBox(height: 20.h),

          Expanded(
            child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
            // get individual shoe
            Shoe individualShoe = value.getUserCart()[index];

            // return the cart item
            return CartItem(shoe: individualShoe,);
          }
        ),
      ),
          // Checkout button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const AddressPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical:16.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))    
                ),
                child: Center(
                  child: Text('Continue to Checkout',style: TextStyle(
                    color: Colors.white,fontSize: 16.sp)
                    ),
                  )
                ),
            SizedBox(height: 25.h)
            ],
          ),
        ),
      );
    }
  }