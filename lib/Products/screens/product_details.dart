import 'package:flutter/material.dart';
import 'package:onlinestore/Products/Models/product_model.dart';
import 'package:onlinestore/Products/cart/cartModel.dart';
import 'package:onlinestore/Products/widget/circular_widget.dart';

class Product_details extends StatefulWidget {
  final ProductModel pro_details;
  final Function addCart;
  const Product_details({super.key, required this.pro_details, required this.addCart});

  @override
  State<Product_details> createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  int quantity=1;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro_details.title),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.pro_details.image,fit: BoxFit.contain,height: 150,),
            SizedBox(height: 10,),
            Text(widget.pro_details.title,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
            SizedBox(height: 5,),
            Text("Price: \$${widget.pro_details.price}",style: TextStyle(
              
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 13,),
            Chip(label: Text(widget.pro_details.category.name,),
            backgroundColor: Colors.orangeAccent,
            ),  
            SizedBox(height: 13,),
            Text("${widget.pro_details.rating.rate}/5 (${widget.pro_details.rating.count})"),
            SizedBox(height: 13,),
            Text(widget.pro_details.description),
        
        
          ],
        ),
      ),
      bottomSheet: Container(
        
        height: 100,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  circular_widget(
                  onPressed: (){
                    setState(() {
                     quantity++;
                     
                    });
                    
                  },
                  text: "+"
                ),
                SizedBox(width:10,),
                Text("Quantity $quantity",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),),
                SizedBox(width:10,),
              circular_widget(
                  onPressed: (){
                    setState(() {
                      if(quantity>1)
                      quantity--;
                      
                    });
                    
                    }, 
                    text: "-"
                ),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: (){
                  widget.addCart(cartModel(id: widget.pro_details.id, product: widget.pro_details, quantity: quantity));
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.orangeAccent.shade700),
                  fixedSize: MaterialStatePropertyAll<Size>(Size(double.infinity,50)),
                  minimumSize:  MaterialStatePropertyAll<Size>(Size(double.infinity,50))
                ),
                child: Text("Add to cart",style: TextStyle(
                  color: Colors.white,
                  
                ),)),
            ),
              
          ],
        ),
      ),
    );
  }
}