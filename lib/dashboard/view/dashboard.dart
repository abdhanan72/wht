import 'package:flutter/material.dart';
import 'package:my_add/cart/view/cart.dart';
import 'package:my_add/home/view/home.dart';
import 'package:my_add/product/view/product.dart';

class Dashboard extends StatefulWidget {
   const Dashboard({super.key});
 

  @override
  State<Dashboard> createState() => _DashboardState();
  
  void setState(Null Function() param0) {}
}

class _DashboardState extends State<Dashboard> {
   int _selectedIndex = 1;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    final List<Widget> _widgets = [
const Home(),
const ViewProduct(),
const ViewCart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(

        title: const Text('Product List'),
       
        actions: [IconButton(onPressed:() {
          
        }, icon: const Icon(Icons.person),),],

      
      ),
      body:_widgets [_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:const  Color(0xFF0BDA51),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Colors.black,),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'view product',
              backgroundColor: Colors.black,),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'view Cart',
              backgroundColor: Colors.black,),
        
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    
    );
  }
}
