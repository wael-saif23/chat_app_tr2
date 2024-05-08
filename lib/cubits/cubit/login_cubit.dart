import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  String? cubitEmail;
  String? cubitPassword;
  bool isLoading = false;
  Future<void> signInMethod(
      {required String? email, required String? password}) async {
    isLoading = true;
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      isLoading = false;
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        emit(LoginFailure(error: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(error: 'wrong-password'));
      } else {
        emit(LoginFailure(error: e.toString()));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
    isLoading = false;
  }
}
