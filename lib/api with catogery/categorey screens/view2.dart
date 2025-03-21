
import 'package:api/api%20with%20catogery/categorey%20service/ctservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Fakestoreservice fakestoreService = Fakestoreservice();

  @override
  Widget build(BuildContext context) {
    final String selectedCategory = Get.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedCategory Details'),
      ),
      body: FutureBuilder(
          future: fakestoreService.getProductsBycatrgory(selectedCategory),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError)
            {
              return Center(child: Text("Error: ${snapshot.error}"),);
            }
            else
            {
              List<Map<String,dynamic>> products = snapshot.data!;
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    Map<String,dynamic> product = products[index];
                    return ListTile(
                      title: Text(product['title']),
                      subtitle: Text(product['description']),
                    );

                  });
            }
          }),
    );
  }
}