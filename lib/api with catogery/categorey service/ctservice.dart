import 'dart:convert';

import 'package:http/http.dart' as http;

class Fakestoreservice{
  final String baseurl="https://fakestoreapi.com";

  Future<List<String>>getMaiCategories()async{
    final response = await http.get(Uri.parse("$baseurl/products/categories"));
    if(response.statusCode==200){
      List<dynamic>categoriesjson =json.decode(response.body);
      List<String>mainCategories =categoriesjson.map((categoriejson)=>categoriejson.toString()).toList();

      return mainCategories;
    }else{
      throw Exception('Failed to load main categories');
    }
  }

Future<List<Map<String,dynamic>>>getProductsBycatrgory(String category)async{
  final response = await http.get(Uri.parse("$baseurl/products/category/$category"));
  if(response.statusCode==200){
    return List<Map<String,dynamic>>.from(json.decode(response.body));
  }else{
    throw Exception("failed to load products for categories");
  }
}
}