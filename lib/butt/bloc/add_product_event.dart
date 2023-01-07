part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class ProductAddEvent extends AddProductEvent {
  ProductAddEvent({
    required this.productname,
    required this.productDetails,
    required this.quantity,
    required this.price,
    required this.image,
  });

  final String productname;
  final String productDetails;
  final int quantity;
  final double price;
  final XFile image;
}


