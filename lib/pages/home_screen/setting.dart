import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/components/navigate.dart';
import 'package:socialapp/components/refactor.dart';
import 'package:socialapp/cubit/home_cubit/social_cubit.dart';
import 'package:socialapp/pages/editprofile_screen/editprofile_screen.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = SocialCubit.get(context).usersModel;

          return Column(
            children: [
              SizedBox(
                height: 240,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    '${cubit?.cover}',
                                  ),
                                  fit: BoxFit.cover))),
                    ),
                    CircleAvatar(
                      radius: 73,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 70,
                        backgroundImage: NetworkImage(
                          '${cubit?.image}',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${cubit?.name}',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                '${cubit?.bio}',
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('1000'),
                          Text(
                            'Posts',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('12k'),
                          Text('Follwers',
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('1k'),
                          Text('Follwing',
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('256'),
                          Text('Photo',
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      navigateto(context: context, widget: EditProFile());
                    },
                    child: const Text('EDIT PROFILE'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
