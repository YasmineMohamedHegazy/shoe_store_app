import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopapp/pages/confirmation_page.dart';
import '../models/cart.dart';



class SummaryPage extends StatelessWidget {
  final String fullName;
  final String phone;
  final String street;
  final String city;

  const SummaryPage({
    super.key,
    required this.fullName,
    required this.phone,
    required this.street,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final userCart = cart.getUserCart();

    double subtotal = userCart.fold(0, (sum, item) => sum + double.parse(item.price));
    double shipping = 20.0; 
    double total = subtotal + shipping;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text("Order Summary")),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: ListView(
          children: [
            // Address Info
            Text("Shipping Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
            Text("$fullName\n$street\n$city,\nPhone: $phone"),
            SizedBox(height: 20.h),

            // Cart Items
            Text("Items", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
            ...userCart.map((shoe) => ListTile(
                  leading: Image.asset(shoe.imagepath, width: 50.w),
                  title: Text(shoe.name),
                  trailing: Text("${shoe.price} EGP"),
                )),

            Divider(thickness: 1.h,),
            ListTile(
              title: const Text("Subtotal"),
              trailing: Text("${subtotal.toStringAsFixed(2)} EGP"),
            ),
            ListTile(
              title: const Text("Shipping"),
              trailing: Text("${shipping.toStringAsFixed(2)} EGP"),
            ),
            ListTile(
              title: const Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text("${total.toStringAsFixed(2)} EGP", style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 30.h),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfirmationPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))
              ),
              child: const Text("Place Order", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
