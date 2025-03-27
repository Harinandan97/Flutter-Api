import 'package:api/api%20provider/provider/recipeprovider.dart';
import 'package:api/api%20provider/screens/Searchr.dart';
import 'package:api/api%20provider/screens/recipegridd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recipepage extends StatelessWidget {
  const Recipepage({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeProvider =Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe'),
        actions: [
          IconButton(onPressed: ()async{
            final String? query =await showSearch(context: context, delegate: RecipeSerchdeligate(),
            );
            if(query!= null && query.isNotEmpty){
              recipeProvider.searchRecipes(query);
            }

          }, icon:Icon(Icons.search))
        ],
      ),
body: recipeProvider.recipenew.isEmpty
        ? Center(child: CircularProgressIndicator(),):LayoutBuilder(
    builder: (context,constraints){
      if(constraints.maxWidth>=600)
      {
        return Recipegridview(recipeProvider.recipenew, 4, constraints.maxWidth);
      }
      else if(constraints.maxWidth>=400)
      {
        return Recipegridview(recipeProvider.recipenew, 2, constraints.maxWidth);
      }
      else
      {
        return Recipegridview(recipeProvider.recipenew, 1, constraints.maxWidth);
      }
    }),
    );
  }
}
