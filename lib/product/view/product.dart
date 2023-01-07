import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:my_add/butt/view/button.dart';
import 'package:my_add/detail/view/detail.dart';
import 'package:my_add/product/bloc/delete_bloc.dart';

class ViewProduct extends StatelessWidget {
  ViewProduct({super.key});

  CollectionReference productData =
      FirebaseFirestore.instance.collection('Product Details');

  final _deletepro = DeleteBloc();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _deletepro,
      child: BlocListener<DeleteBloc, DeleteState>(
        listener: (context, state) {
          if (state is ProductDeleteSucess) {
           
            MotionToast(
              icon: Icons.done,
              primaryColor: Colors.red,
              description: const Text(' Product Deleted'),
            ).show(context);
          } else {
            MotionToast(
              icon: Icons.done,
              primaryColor: Colors.red,
              description: const Text(' Couldn\'t Delete product'),
            ).show(context);
          }
        },
        child: Scaffold(
          body: StreamBuilder(
            stream: productData
                .where('userid', isEqualTo: _auth.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data!.docs);
                final productItems = snapshot.data!.docs;

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                    ),
                    itemCount: productItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(prode: productItems[index]),
                            )),
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Image.network(
                                productItems[index]['image'].toString(),
                                height: 150,
                                width: 150,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                productItems[index]['productName'].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    productItems[index]['price'].toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const Icon(Icons.currency_rupee_sharp),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _deletepro.add(DeleteProductEvent(
                                            productId: productItems[index]['productid']
                                                .toString()));
                                      },
                                      icon: const Icon(Icons.delete_forever)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.update_outlined))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.red));
              }
            },
          ),
        ),
      ),
    );
  }
}
