 import 'dart:math';

import 'package:api/state%20mangement%20uing%20provider/model/movies.dart';
import 'package:flutter/foundation.dart';

 final List<Movie>MovieList= List.generate(100,
         (index)=>
             Movie(title: 'movie $index',
  time: '${Random().nextInt(100)+60}minitues'

));
class movieprovider extends ChangeNotifier{


  final  List<Movie> mainpagemovie= MovieList;


  List<Movie> get firstpagemovie => mainpagemovie;


  final List<Movie> _wishListmovie=[];



 List<Movie> get moviesWishList => _wishListmovie;

  void addtowishlist(Movie movieFromMianpage){

    _wishListmovie.add(movieFromMianpage);
    notifyListeners();

  }
  void removefromWishlist(Movie removemovie){
    _wishListmovie.remove(removemovie);
    notifyListeners();
  }
}