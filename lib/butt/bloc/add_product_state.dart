part of 'add_product_bloc.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}


class ProductAddedSucces extends AddProductState {}

class ProductAddFailed extends AddProductState{}

