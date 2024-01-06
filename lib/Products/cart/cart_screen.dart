import 'package:flutter/material.dart';
import 'package:onlinestore/Products/cart/cartModel.dart';

class Cart extends StatefulWidget {
  final List<cartModel> cart;
  final Function removeCart;
  const Cart({super.key, required this.cart, required this.removeCart});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  subtotal(){
    return widget.cart.map((e) => e.product.price*e.quantity).reduce((value, element) => value+element);
  }
  double shipping_charge=80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context,index){
                var index_num=widget.cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(index_num.product.image),
                  ),
                  title: Text(index_num.product.title),
                  subtitle: Text("\$${index_num.product.price.toString()} X ${index_num.quantity} = \$${index_num.product.price*index_num.quantity} "),
                  trailing: IconButton(
                    onPressed: (){
                      widget.removeCart(widget.cart[index].product.id);
                    },
                    icon: Icon(Icons.delete,color: Colors.red,),
                  ),
                );
              }
              ),
          )
        ],
      ),
      bottomSheet:widget.cart.length==0?SizedBox():Container(
        height: MediaQuery.of(context).size.height*0.15,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12)
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Sub Total:\$${subtotal()}"),
            Text("Delivery Charge:\$${shipping_charge}"),
            Text("Total:\$${subtotal()+shipping_charge}"),
            TextButton(
              style: ButtonStyle(
                backgroundColor:MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: (){},
             child: Text('CheckOut',style: TextStyle(
              color: Colors.white
             ),))
  
          ],
        ),
      ),
    );
  }
}