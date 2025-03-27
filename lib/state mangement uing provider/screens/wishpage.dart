import 'package:api/state%20mangement%20uing%20provider/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<movieprovider>().moviesWishList;
    return Scaffold(
      appBar: AppBar(title: Text('My wishlist  ${wishmovies.length}'),
      ),
      body:
      ListView.builder(
          itemCount: wishmovies.length,
          itemBuilder: (context,index){
            final wishMovie = wishmovies[index];
            return Card(
              child: ListTile(
                title: Text(wishMovie.title),
                subtitle: Text(wishMovie.title!),
                trailing: TextButton(onPressed:

                    (){
                  context.read<movieprovider>().removefromWishlist(wishMovie);
                    },

                    child: Text("remove")),
              ),
            );

      }),
    );
  }
}
