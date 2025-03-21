import 'package:http/http.dart' as http;

import '../model/productmodel.dart';

class httpservice{
  static Future<List<Product>> fetchproducts() async{
    var respone =await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(respone.statusCode ==200){
      var data =respone.body;
      return productFromJson(data);
    }else{
      throw Exception();
    }
  }

}