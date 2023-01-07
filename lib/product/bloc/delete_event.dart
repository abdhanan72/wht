part of 'delete_bloc.dart';

@immutable
abstract class DeleteEvent {}

class DeleteProductEvent extends DeleteEvent {
  DeleteProductEvent({required this.productId});

  String productId;
}
