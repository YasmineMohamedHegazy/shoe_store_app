import 'package:flutter/material.dart';
import 'package:shoes_shopapp/models/shoe.dart';


class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile ({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(left: 25),width: 200,
    decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(12)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      //shoe pic
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(shoe.imagepath)),

     //Description
     Padding(
       padding: const EdgeInsets.symmetric(horizontal: 25.0),
       child: Text(
        shoe.description,
        style: TextStyle(color:Colors.grey[600]),),
     ),

    // price and details
    Padding(
      padding: const EdgeInsets.only(left: 12.0), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //pushed the plus icon to the end
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //shoe name
              Text(shoe.name,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
              overflow: TextOverflow.ellipsis,
              ),
      
              const SizedBox(height: 5),
              //price
              Text(shoe.price + 'EGP',style: const TextStyle(color: Colors.black),),
              ],),),
              //plus button
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(12), 
                  decoration: const BoxDecoration(color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(12),bottomRight:Radius.circular(12)
                    )),
                    child: const Icon(Icons.add,color: Colors.white,),
                ),
              )
              ],),
    )
   
    ],
    )
    );
    
  }
}