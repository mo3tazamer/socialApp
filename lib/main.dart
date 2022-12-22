import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Services/local/cachehelper.dart';
import 'package:socialapp/components/themes.dart';
import 'package:socialapp/costants/const.dart';
import 'package:socialapp/cubit/home_cubit/social_cubit.dart';
import 'package:socialapp/pages/home_screen/home_layout.dart';
import 'package:socialapp/pages/login_screen/social_login.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uid = await CacheHelper.getdata(key: 'uid');
  print('uid is $uid');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SocialCubit()..getUserData()..getPosts()..getAllUsers()),
      ],
      child:  const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      home: uid != null ? const HomeLayOut() : SocialLogIn(),
    );
  }
}
