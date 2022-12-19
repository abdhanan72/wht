import 'package:flutter/material.dart';
import 'package:my_add/butt/view/button.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
       floatingActionButton: FloatingActionButton(onPressed:() => Navigator.push(context,MaterialPageRoute(builder: (context) => AddProduct(),)),child:const  Icon(Icons.add),),
      body: const Text('data'),
    );
  }
}