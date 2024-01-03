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
      )
    );
  }
}