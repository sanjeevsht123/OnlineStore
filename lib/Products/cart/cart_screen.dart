import 'package:flutter/material.dart';
import 'package:onlinestore/Products/cart/cartModel.dart';
import 'package:onlinestore/Products/cart/checkout.dart';

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
          widget.cart.length==0?
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(" No Item to show"))):
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context,index){
                var index_num=widget.cart[index];
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    widget.removeCart(index_num.product.id);
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                  key: Key(index_num.id.toString()),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(index_num.product.image),
                    ),
                    title: Text(index_num.product.title),
                    subtitle: Text("\$${index_num.product.price.toString()} X ${index_num.quantity} = \$${index_num.product.price*index_num.quantity} "),
                    trailing: IconButton(
                      onPressed: (){
                              showDialog(
                              context: context,
                              builder: (context){
                                return AlertDialog(
                                  title: Text("Delete Item"),
                                  content: Text("Are you sure you want to delete ?"),
                                  actions: [
                                    TextButton(
                                      onPressed:(){
                                        Navigator.pop(context);
                                      } , 
                                      child: Text("Cancel")),

                                      TextButton(
                                        onPressed: (){
                                          widget.removeCart(index_num.product.id);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Delete"))

                                  ],
                                );
                              });
                              },
                      icon: Icon(Icons.delete,color: Colors.red,),
                    ),
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
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=>CheckOut())
                );
              },
             child: Text('CheckOut',style: TextStyle(
              color: Colors.white
             ),))
  
          ],
        ),
      ),
    );
  }
}