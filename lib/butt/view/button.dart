import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_add/butt/bloc/add_product_bloc.dart';
import 'package:my_add/dashboard/view/dashboard.dart';
import 'package:my_add/product/view/product.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final auth = FirebaseAuth.instance;
  late final XFile? img;

  Future<XFile?> getImage() async {
    final imagePicker = ImagePicker();

    img = await imagePicker.pickImage(source: ImageSource.gallery);
  
  }

  final namecontroller = TextEditingController();
  final detailconrtoller = TextEditingController();
  final quantitycontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final _addproduct = AddProductBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _addproduct,
      child: BlocListener<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state is ProductAddedSucces) {
            Navigator.push(
                context,
                
                MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ));
            MotionToast(
              icon: Icons.done,
              primaryColor: Colors.red,
              description: const Text(' successfully Added'),
            ).show(context);
          } else {
            MotionToast(
              icon: Icons.done,
              primaryColor: Colors.red,
              description: const Text(' Failed'),
            ).show(context);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: getImage,
                      child: const Text(
                        'Upload Image',
                        style: TextStyle(color: Color(0xFFF50514)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: namecontroller,
                        cursorColor: const Color(0xFFF50514),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(maxLines: 7,
                        controller: detailconrtoller,
                        cursorColor: const Color(0xFFF50514),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: quantitycontroller,
                        cursorColor: const Color(0xFFF50514),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: pricecontroller,
                        cursorColor: const Color(0xFFF50514),
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
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF50514),
                      ),
                      onPressed: () {
                        _addproduct.add(
                          ProductAddEvent(
                            productname: namecontroller.text,
                            productDetails: detailconrtoller.text,
                            quantity: int.parse(quantitycontroller.text),
                            price: double.parse(pricecontroller.text),
                            image: img!,
                          ),
                        );
                      },
                      child: const Text('ADD'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
