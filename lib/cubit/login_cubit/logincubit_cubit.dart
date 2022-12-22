import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'logincubit_state.dart';

class LoginCubit extends Cubit<LogincubitState> {
  LoginCubit() : super(LogincubitInitial());

  var userUid;
  void Postdata({required String email, required String password}) {
    emit(Logincubitloading());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userUid = value.user?.uid;
      emit(Logincubitsucsess());
    }).catchError((onError) {
      emit(Logincubiterror(onError.toString()));
      print(onError.toString());
    });
  }
}
