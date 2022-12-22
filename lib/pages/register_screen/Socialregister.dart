import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialapp/Services/local/cachehelper.dart';
import 'package:socialapp/components/navigate.dart';
import 'package:socialapp/pages/home_screen/home_layout.dart';
import '../../components/refactor.dart';
import '../../costants/const.dart';
import '../../cubit/register_cubit/Register_cubit.dart';

class SocialRegister extends StatelessWidget {
  final fkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final name = TextEditingController();

  SocialRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(foregroundColor: Colors.black),
        body: SingleChildScrollView(
          child: Form(
            key: fkey,
            child: Column(
              children: [
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                defultFormField(
                    obscureText: false,
                    validatormessage: 'please Enter your name',
                    onTap: () {},
                    sufficons: const Icon(Icons.man),
                    hintText: 'Enter Your name',
                    label: 'name',
                    controller: name),
                defultFormField(
                    obscureText: false,
                    validatormessage: 'please Enter your Email',
                    onTap: () {},
                    sufficons: const Icon(Icons.man),
                    hintText: 'Enter Your Email',
                    label: 'Email',
                    controller: email),
                defultFormField(
                    obscureText: false,
                    validatormessage: 'please Enter your phone',
                    onTap: () {},
                    sufficons: const Icon(Icons.man),
                    hintText: 'Enter Your phone',
                    label: 'phone',
                    controller: phone),
                defultFormField(
                    validatormessage: 'please Enter your password',
                    controller: password,
                    onTap: () {},
                    sufficons: const Icon(Icons.visibility),
                    hintText: 'Enter Your PassWord',
                    label: 'PassWord',
                    obscureText: true),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is Registercubitsucsess) {
                      CacheHelper.savedata(
                          key: 'uid',
                          value:
                              BlocProvider.of<RegisterCubit>(context).uidCubit);
                      uid = BlocProvider.of<RegisterCubit>(context).uidCubit;
                      navigateandfinish(
                          context: context, widget: const HomeLayOut());
                    }

                    if (state is UserCreatecubiterror) {
                      Fluttertoast.showToast(
                          msg: state.error.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    if (state is Registercubitloading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is Registercubitsucsess) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (fkey.currentState!.validate()) {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .userRegisterWithEmailAndPassword(
                                    name: name.text,
                                    email: email.text,
                                    phone: phone.text,
                                    password: password.text,
                                  );
                                }
                              },
                              child: const Text('Register Now')),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (fkey.currentState!.validate()) {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .userRegisterWithEmailAndPassword(
                                    name: name.text,
                                    email: email.text,
                                    phone: phone.text,
                                    password: password.text,
                                  );
                                }
                              },
                              child: const Text('Register Now')),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
