import 'package:flutter/material.dart';
import 'package:onlinestore/Products/Models/product_model.dart';
import 'package:onlinestore/Products/screens/product_details.dart';

class Product_card extends StatelessWidget {
  final ProductModel productModel;
  final Function addCart;
  const Product_card({super.key, required this.productModel, required this.addCart,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_)=>
            Product_details(
              addCart: addCart,
              pro_details: productModel,
            ))
        );
      },
      child: Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              height:300,
              width:300,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 2),
                    blurRadius: 5
                  )
                ]
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(productModel.image,height:MediaQuery.of(context).size.height*.1,),
                    SizedBox(height: 10,),
                    Text(productModel.title),
                  ],
                ),
              ),
            ),
    );
  }
}