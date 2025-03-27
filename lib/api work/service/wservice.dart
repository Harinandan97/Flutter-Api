import 'package:dio/dio.dart';

class Dioservice {
  var url = "https://dummyjson.com/users";
  Future<dynamic>getData()async{
    Dio dio =Dio();
    return await dio.get(url,options: Options(responseType: ResponseType.json,
        method: 'GET')).then((response){
      return response;
    });
  }
}