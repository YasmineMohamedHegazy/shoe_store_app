import "package:flutter/material.dart";
import "package:shoes_shopapp/models/shoe.dart";


class Cart extends ChangeNotifier {
    // List of shoes for sale
    List <Shoe> shoeShop = [ 
      Shoe(
      name: 'Pink shoes', price: '350',
     imagepath: 'lib/images/shoe4.png', description: 'Sportive running Shoes'),

     Shoe(
      name: 'white jean sneakers', price: '400',
      imagepath: 'lib/images/shoe5.png', description: 'Elegant Shoes'),

     Shoe(
      name: 'Beige Shoes', price: '355',
      imagepath: 'lib/images/shoe13.png', description: 'Classic Elegant Shoes'),

      Shoe(
        name: 'Green Shoes', price: '350',
         imagepath: 'lib/images/shoe1.png', description: 'Everyday Shoes')
     ];
   // List of items in user Cart
   List<Shoe> userCart = []; //empty cart at first

  // list of shoes for sale
  List<Shoe> getShoeList() { //defining the function
    return shoeShop;
  }

  // get Cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to Cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }
  //remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

}