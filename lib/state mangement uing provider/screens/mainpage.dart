
import 'package:api/state%20mangement%20uing%20provider/provider/movie_provider.dart';

import 'package:api/state%20mangement%20uing%20provider/screens/wishpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider<movieprovider>(create:
      (BuildContext context)=>movieprovider(),
      child: MaterialApp(
        home: MovieMain(),
      )

  ));
}
class MovieMain extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<movieprovider>().moviesWishList;
    var movies = context.watch<movieprovider>().firstpagemovie;
    return Scaffold(
      appBar: AppBar(title: const Text("Movies"),

      ),
      body:Column(
        children: [
         ElevatedButton.icon(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WishListScreen())),
             icon: const Icon(Icons.favorite), label: Text("Goto wishlist ${wishmovies.length}")),
          Expanded(child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context,index){
                final currentMovie =movies[index];
                return Card(
                  child:    ListTile(
                    title: Text(currentMovie.title),
                subtitle: Text(currentMovie.time!),
                trailing: IconButton(
                onPressed: (){
                if(!wishmovies.contains(currentMovie))
                {
                context
                    .read<movieprovider>()
                    .addtowishlist(currentMovie);
                }
                else
                {
                context.read<movieprovider>()
                    .removefromWishlist(currentMovie);
                }
                },
                icon: Icon(Icons.favorite,
                color: wishmovies.contains(currentMovie)
                ? Colors.red
                    : Colors.black26
                ),
                ),
                ),
                );

          }))
        ],
      ) ,
    );
  }
}
