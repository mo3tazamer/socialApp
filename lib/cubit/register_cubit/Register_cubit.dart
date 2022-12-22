import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/usermodel.dart';

part 'Register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegistercubitInitial());

  String? uidCubit;

  void userCreateData({
    required String name,
    required String email,
    required String phone,
    required String uid,
  }) async {
    emit(UserCreatecubitloading());
    UsersModel usersModel = UsersModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      image:
          'https://img.freepik.com/free-photo/portrait-cute-young-brunette-student-holding-exercise-books-isolated-white-wall_231208-11488.jpg?w=826&t=st=1670261434~exp=1670262034~hmac=3ab4b8ccf00f0c5e466df27f5e9b1ea650b1caa4caa486d899f7c13f17a785a1',
      cover:
          'https://img.freepik.com/premium-photo/youthful-student-kid-schoolboy-raising_1098-6756.jpg?w=826',
      bio: 'write your bio',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(usersModel.tomap())
        .then((value) {
      emit(UserCreatecubitsucsess());
    }).catchError((onError) {
      print(onError.toString());

      emit(UserCreatecubiterror(onError.toString()));
    });
  }

  void userRegisterWithEmailAndPassword({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(Registercubitloading());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      uidCubit = value.user?.uid;
      print(value.additionalUserInfo?.isNewUser);
      userCreateData(
        email: email,
        name: name,
        phone: phone,
        uid: value.user!.uid,
      );
    }).catchError((onError) {
      print(onError.toString());

      emit(Registercubiterror());
    });
  }
}
