import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialapp/pages/home_screen/home_layout.dart';
import '../../Services/local/cachehelper.dart';
import '../../components/navigate.dart';
import '../../components/refactor.dart';
import '../../costants/const.dart';
import '../../cubit/login_cubit/logincubit_cubit.dart';
import '../register_screen/Socialregister.dart';

class SocialLogIn extends StatelessWidget {
  final fkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  SocialLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(foregroundColor: Colors.black),
        body: SingleChildScrollView(
          child: Form(
            key: fkey,
            child: Column(
              children: [
                Text(
                  'LogIn',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                defultFormField(
                    obscureText: false,
                    validatormessage: 'please Enter your Email',
                    onTap: () {},
                    sufficons: const Icon(Icons.man),
                    hintText: 'Enter Your Email',
                    label: 'Email',
                    controller: email),
                defultFormField(
                    validatormessage: 'please Enter your password',
                    controller: password,
                    onTap: () {},
                    sufficons: const Icon(Icons.visibility),
                    hintText: 'Enter Your PassWord',
                    label: 'PassWord',
                    obscureText: true),
                BlocConsumer<LoginCubit, LogincubitState>(
                  listener: (context, state) {
                    if (state is Logincubitsucsess) {
                      CacheHelper.savedata(
                          key: 'uid',
                          value: BlocProvider.of<LoginCubit>(context).userUid);
                      uid = BlocProvider.of<LoginCubit>(context).userUid;
                      navigateandfinish(
                          context: context, widget: const HomeLayOut());
                    }

                    if (state is Logincubiterror) {
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
                    if (state is Logincubitloading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is Logincubitsucsess) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (fkey.currentState!.validate()) {
                                  BlocProvider.of<LoginCubit>(context).Postdata(
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                              child: const Text('Sign in')),
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
                                  BlocProvider.of<LoginCubit>(context).Postdata(
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                              child: const Text('Sign in')),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('don\'t have an account'),
                    TextButton(
                        onPressed: () {
                          navigateto(
                              context: context, widget: SocialRegister());
                        },
                        child: const Text('Register'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
