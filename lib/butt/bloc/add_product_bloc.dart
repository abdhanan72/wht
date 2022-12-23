import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductEvent>((event, emit) async {
      if (event is ProductAddEvent) {
        try {
          final productRef =
              FirebaseFirestore.instance.collection('Product Details');

          final auth = FirebaseAuth.instance;
          final userid = auth.currentUser!.uid;
          final uuid = Uuid();
          final productId = uuid.v4();
          final datetime = DateTime.now();
          final time = '${datetime.hour}:${datetime.minute}pm';

          final reference = FirebaseStorage.instance
              .ref()
              .child('image')
              .child(event.image.name);
          final file = File(event.image.path);

          await reference.putFile(file);

          final imageLink = await reference.getDownloadURL();
          await productRef.doc(productId).set({
            'image': imageLink,
            'productName': event.productname,
            'description': event.productDetails,
            'price': event.price,
            'userid': userid,
            'productid': productId,
            'date': time,
          });

          emit(ProductAddedSucces());
        } catch (e) {
          emit(ProductAddFailed());
        }
      }
    });
  }
}
