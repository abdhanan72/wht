import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:30),
          child: Column(
            
            children: [
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      cursorColor: const Color(0xFF0BDA51),
                      decoration: InputDecoration(
                        hintText: 'Product Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                       
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      cursorColor: const Color(0xFF0BDA51),
                      decoration: InputDecoration(
                        hintText: 'Product Details',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                       
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20,),

                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      cursorColor: const Color(0xFF0BDA51),
                      decoration: InputDecoration(
                        hintText: 'Product quantity',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                       
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      cursorColor: const Color(0xFF0BDA51),
                      decoration: InputDecoration(
                        hintText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                       
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor:const  Color(0xFF0BDA51),
                  ),
                    
                    onPressed: () {
                    
                  }, child:const Text('ADD'),)
                  
            ],
          ),
        ),
      ),
      

    );
  }
}
