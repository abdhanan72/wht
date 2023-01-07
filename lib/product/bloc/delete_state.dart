part of 'delete_bloc.dart';

@immutable
abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class ProductDeleteSucess extends DeleteState {}

class ProductDeleteFailed extends DeleteState {}
