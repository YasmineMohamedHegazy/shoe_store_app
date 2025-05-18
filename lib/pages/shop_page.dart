import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopapp/components/shoe_tile.dart';
import 'package:shoes_shopapp/models/cart.dart';
import 'package:shoes_shopapp/models/shoe.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});


  final List<Shoe> allShoes = [
    Shoe(name: 'Olive green Shoes', price: '440', description: 'Lightweight and fast', imagepath: 'lib/images/shoe2.png'),
    Shoe(name: 'black green Shoes', price: '550', description: 'Timeless street style', imagepath: 'lib/images/shoe3.png'),
    Shoe(name: 'Pink Shoes', price: '500', description: 'Sportive running shoe', imagepath: 'lib/images/shoe4.png'),
    Shoe(name: 'Colorful Shoes', price: '440', description: 'Premium comfort and quality', imagepath: 'lib/images/shoe9.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: ListView.builder(
          itemCount: allShoes.length,
          itemBuilder: (context, index) {
            final shoe = allShoes[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 20.0.h),
              child: ShoeTile(
                shoe: shoe,
                onTap: () {
                  cart.addItemToCart(shoe);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${shoe.name} successfully added to cart!"),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
