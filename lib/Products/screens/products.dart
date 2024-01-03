import 'package:flutter/material.dart';
import 'package:onlinestore/Products/Models/product_model.dart';
import 'package:onlinestore/Products/Services/product_service.dart';
import 'package:onlinestore/Products/widget/product_card.dart';

class Product extends StatefulWidget {
  final Function addCart;
  const Product({Key? key, required this.addCart}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<ProductModel>? productModels;
  final Product_service productService = Product_service();
  List<dynamic>? category;

  @override
  void initState() {
    super.initState();
    fetchProduct();
    fetchCategory();
  }

  fetchProduct() async {
    productModels = await productService.getProduct();
    setState(() {});
  }

  fetchCategory() async{
    category=await productService.getCategorey();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Products",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          SizedBox(height: 10,),
          category!=null?
          Wrap(
            spacing: 5,
            children: 
            category!.map((category) =>
                ActionChip(
                  onPressed: () async{
                   productModels=await productService.getProductCategory(category);
                    setState(() {});
                  },
                  backgroundColor: Colors.orangeAccent,
                  label: Text(category.toString()
                  )
                  )
                  ).toList()
          ):Center(
            child: CircularProgressIndicator(),
          ),
          Expanded(
            child:productModels !=null?
             GridView.builder(
              itemCount: productModels?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                
                ),
              itemBuilder: (ctx,index){
                return Product_card(
                  addCart: widget.addCart,
                 productModel: productModels![index],
                );
              }):
              Center(
                    child: CircularProgressIndicator(),
                  ),
          )         
        ],
      ),

     
    );
  }
}
