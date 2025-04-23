import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopapp/models/cart.dart';
import 'package:shoes_shopapp/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem ({super.key, required this.shoe}); 

  @override
  State <CartItem> createState() => _CartItemState();
}

class _CartItemState extends State <CartItem> {

// remove item from cart
void removeItemFromCart() {
  Provider.of<Cart>(context, listen:false).removeItemFromCart(widget.shoe);
}


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100],borderRadius:BorderRadius.circular(8)
      ),
      margin: EdgeInsets.only(bottom: 10), //this added space between every item box and the other under it
      child: ListTile(
        leading: Image.asset(widget.shoe.imagepath),
        title: Text(widget.shoe.name),
        subtitle: Text('${widget.shoe.price}EGP'),
        trailing: IconButton(icon:Icon(Icons.delete), onPressed: removeItemFromCart,),
      ),
    );
    
    
  }
}
    
  
