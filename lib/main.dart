import 'package:api/api%20provider/provider/recipeprovider.dart';
import 'package:api/api%20provider/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>RecipeProvider()..fetchRecipes())
    ],
      child: MaterialApp(title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.blue),debugShowCheckedModeBanner: false,
        home: Recipepage(),
      ),
    );
  }
}
