import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  String? cubitEmail;
  String? cubitPassword;
  bool isLoading = false;
  Future<void> registerMethod(
      {required String? email, required String? password}) async {
    isLoading = true;
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      isLoading = false;
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        emit(RegisterFailure(error: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(RegisterFailure(error: 'wrong-password'));
      } else {
        emit(RegisterFailure(error: e.toString()));
      }
    } catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
    isLoading = false;
  }
}
