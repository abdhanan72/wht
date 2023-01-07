import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitial()) {
    on<DeleteEvent>((event, emit) async {
      if (event is DeleteProductEvent) {
        try {
          final productRef =
              FirebaseFirestore.instance.collection('Product Details');
          await productRef.doc(event.productId).delete();

          emit(ProductDeleteSucess());
        } catch (e) {
          emit(ProductDeleteFailed());
        }
      }
    });
  }
}
