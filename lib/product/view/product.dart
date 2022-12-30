import 'package:flutter/material.dart';


class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 280,
            crossAxisCount: 2,
          ),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                
              },
              child: Card(child: Column(children: [
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtESFjvzaJpiy4RQvS8n7diWPlQfHSUH9j1w&usqp=CAU',
                height: 200,
                width: 140,
                ),
                Title(color: Colors.black, child:Text('food'),
                ),
            
                const Text(r'60$'),
              
              ],),),
            );
          }),
    );
  }
}
