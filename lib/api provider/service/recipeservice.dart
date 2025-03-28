import 'package:api/api%20provider/model/recipemodel.dart';
import 'package:http/http.dart' as http;

class Recipeservice{
  static const String baaseurl ="https://dummyjson.com/recipes";

  Future<Recipes>fetchRecipes()async{
    final response =await http.get(Uri.parse(baaseurl));
    if(response.statusCode==200){
      var data =response.body;

      return recipesFromJson(data);

    }else{
      throw Exception('Failed to load');
    }
  }
}