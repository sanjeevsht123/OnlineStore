import 'package:flutter/material.dart';
import 'package:onlinestore/Products/account/account.dart';
import 'package:onlinestore/Products/cart/cartModel.dart';
import 'package:onlinestore/Products/cart/cart_screen.dart';
import 'package:onlinestore/Products/screens/products.dart';
import 'package:onlinestore/Products/screens/searchScreen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<Widget> pages=[
  ];
  List<cartModel> cart=[];


  // @override
  // void initState() {
  //   super.initState();
  //   pages=[
  //   Product(addCart: addCart),
  //   searchScreen(addCart: addCart,),
  //   Cart(cart: cart, removeCart: removeCart,),
  //   Account_screen()
  //   ];
  // }

  void addCart(cartModel cartProduct){
    setState(() {
      final index=cart.indexWhere((element) => element.id==cartProduct.product.id);
      if(index==-1){
      cart.add(cartProduct);
      }
      else{
        cart[index].quantity +=cartProduct.quantity;
      }
      
    });
  }


  void removeCart(int cartId){
    setState(() {
      cart.removeWhere((element) => element.id==cartId);
    });
  }
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    pages=[
    Product(addCart: addCart),
    searchScreen(addCart: addCart,),
    Cart(cart: cart, removeCart: removeCart,),
    Account_screen()
    ];
    return Scaffold(
      body:pages[currentindex],
       bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            currentindex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"
              ),

            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
            ),
        ],
      ),
    );
  }
}