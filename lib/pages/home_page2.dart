import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopapp/components/shoe_tile.dart';
import 'package:shoes_shopapp/models/shoe.dart';
import '../models/cart.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2 ({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

//add shoe to cart
void addShoeToCart(BuildContext context, shoe) {
  Provider.of<Cart>(context, listen: false).addItemToCart(shoe); //defining the function

//alert the user, shoe successfully added
showDialog(
  context: context,
  builder: (context) => AlertDialog(
  title: Text('Successfully added!'),
  content: Text('Check your cart'),

),
);
}

class _HomePage2State extends State <HomePage2> {
  @override
  Widget build (BuildContext build) {
    
    return Consumer<Cart>(builder: (context, value, child) => Column(children: [
      //search bar
      Container(
        padding: const EdgeInsets.all(12),margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, //de khalet el search icon fl akher 3ashan khalet fe space ben el text wl icon
          children: [
            Text('Search'),Icon(Icons.search,color: Colors.grey,),
          ],
        ),),

     //message
     Padding(
       padding: const EdgeInsets.symmetric(vertical: 25.0),
       child: Text('Step into comfort, style and premium quality.',style: TextStyle(color: Colors.grey[600]),),
     ),

    //hot picks
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.end,
      children: const [Text('Best Sellers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
      Text('See all',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)],),
    ),

    const SizedBox(height: 10),

    //List of shoes for sale
Expanded(
  child: ListView.builder(
    itemCount: value.getShoeList().length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      // get a shoe from shop list
      Shoe shoe = value.getShoeList()[index];

      // return the shoe
      return ShoeTile(
      shoe: shoe,
      onTap: () => addShoeToCart(context, shoe),
      );
    },
  ),
),
         Divider(color: Colors.white,)
    ],
    ) );
  }
}
