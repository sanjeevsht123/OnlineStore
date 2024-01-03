import 'package:flutter/material.dart';
import 'package:onlinestore/Products/Models/product_model.dart';
import 'package:onlinestore/Products/Services/product_service.dart';
import 'package:onlinestore/Products/widget/product_card.dart';

class searchScreen extends StatefulWidget {
  final Function addCart;
  const searchScreen({super.key, required this.addCart});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
    TextEditingController searchInput=TextEditingController();
    List<ProductModel>? filter;

    search()async{
      final products=await Product_service().getProduct();
      filter=products.where((product) => product.title.toUpperCase().contains(searchInput.text.toUpperCase())).toList();
      setState(() {});
    }

  //   @override
  // void dispose() {
  //   searchInput.dispose();
  //   super.dispose();
  // }
  
  @override
  Widget build(BuildContext context) {



  
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchInput,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder()
                
              ),
             onChanged: (value){
              search();
             },
            ),
            SizedBox(height: 10,),

            filter!=null?
            Expanded(
              child:ListView.builder(
                itemCount: filter!.length,
                itemBuilder: (context,index){
                  return SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                    child: Product_card(
                      addCart: widget.addCart,
                      productModel: filter![index],));
                })
            )
            :Center(
              child: CircularProgressIndicator(),
            )
            
          ],
        ),
      ),
    );
  }
}