import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:socialapp/components/navigate.dart';
import 'package:socialapp/cubit/home_cubit/social_cubit.dart';
import 'package:socialapp/pages/post_screen/post_screen.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(SocialCubit.get(context)
                .titles[SocialCubit.get(context).indexValue]),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateto(context: context, widget:  NewPost());
                  },
                  icon: const Icon(IconBroken.Plus)),
              IconButton(
                  onPressed: () {}, icon: const Icon(IconBroken.Notification)),
              IconButton(onPressed: () {}, icon: const Icon(IconBroken.Search))
            ],
          ),
          body: SocialCubit.get(context)
              .screens[SocialCubit.get(context).indexValue],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: SocialCubit.get(context).indexValue,
            onTap: (index) {
              SocialCubit.get(context).bottomNavChange(index);
            },
            items: const [
              BottomNavigationBarItem(
                  label: 'Home', icon: Icon(IconBroken.Home)),
              BottomNavigationBarItem(
                  label: 'Chat', icon: Icon(IconBroken.Chat)),
              BottomNavigationBarItem(
                  label: 'Users', icon: Icon(IconBroken.User)),
              BottomNavigationBarItem(
                  label: 'Setting', icon: Icon(IconBroken.Setting)),
            ],
          ),
        );
      },
    );
  }
}
