import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        final auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
              email: event.email, password: event.Password);
          emit(LoginSucces());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(message: e.code));
        }
      }
    });
  }
}
