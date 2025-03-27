import 'package:api/api%20provider/model/recipemodel.dart';
import 'package:api/api%20provider/service/recipeservice.dart';
import 'package:flutter/cupertino.dart';

class RecipeProvider extends ChangeNotifier{
  List<Recipe> recipesdata=[];
  List<Recipe> fillterrecipe=[];

  List<Recipe> get recipenew => fillterrecipe.isNotEmpty ? fillterrecipe: recipesdata;
  Future<void>fetchRecipes()async{
    try{
   Recipes data =await Recipeservice().fetchRecipes();
   recipesdata =data.recipes?? [];

   fillterrecipe=recipesdata;
    }catch(e){
      throw Exception('Failed to load recipes : $e');
    }
  }
  void searchRecipes(String query){
    fillterrecipe = recipesdata.where((recipe){
      return recipe.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }

}