import 'package:api/api%20provider/model/recipemodel.dart';
import 'package:api/api%20provider/screens/details.dart';
import 'package:api/api%20provider/screens/home.dart';
import 'package:flutter/material.dart';

class  Recipegridview extends StatelessWidget {
  final List<Recipe> recipes;
  final int crossAxisCount;
  final double maxWidth;

  Recipegridview(this.recipes, this.crossAxisCount, this.maxWidth);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0),
        itemCount: recipes.length,

        itemBuilder: (context,index){
      final recipe= recipes[index];
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RciprDetailpage(recipe:recipe)
          )
          );

        },
        child: Card(
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(height: maxWidth/crossAxisCount * 0.6,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)
                ),
                child: recipe.image != null ?
                    Image.network(recipe.image!,
                    fit: BoxFit.cover,):Container(color: Colors.grey,)

              ),)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 40.0,
                      child: Text(recipe.name ?? '',style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Text('cusine: ${recipe.cuisine ?? 'unknown'}',

                  style: TextStyle(color: Colors.grey[600]),
              overflow: TextOverflow.ellipsis,),
              Text('Difficulty: ${difficultyValues.reverse[recipe.difficulty]??'unknown'}',
              style: TextStyle(color: Colors.grey[600],overflow: TextOverflow.ellipsis),)
            ],
          ),
        ),
      );

        });


  }
}
