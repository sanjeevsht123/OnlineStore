import 'package:dio/dio.dart';
import 'package:onlinestore/Products/Models/product_model.dart';

class Product_service{
  Dio dio=Dio();
  Future<List<ProductModel>> getProduct() async{
    try{
    final response=await dio.get("https://fakestoreapi.com/products");

    if(response.statusCode==200)
    {
      final product=response.data;
      final productModel=List<ProductModel>.from((product as List).map((e) => ProductModel.fromJson(e)));
      return productModel;
    }
    else{
      throw Exception("Data not Found");
    }
    }
    catch(e){
      rethrow;
    }
  }

  Future<List<dynamic>> getCategorey() async{
    try{

      final response=await dio.get('https://fakestoreapi.com/products/categories');

      if(response.statusCode==200){
        final responseData=response.data;
        return responseData;
      }
      else{
        throw Exception("Data not Found");
      }

    }
    catch(e){
      rethrow;
    }
  }

  Future<List<ProductModel>> getProductCategory(category_name) async{
    try{
      final response=await dio.get('https://fakestoreapi.com/products/category/$category_name');

      if(response.statusCode==200){
        final product=response.data;
        final productModel=List<ProductModel>.from((product as List).map((e) => ProductModel.fromJson(e)));
          return productModel;
      }
      else
      throw Exception('Category not Found');
    }

    catch(e){
      rethrow;
    }
  }

}