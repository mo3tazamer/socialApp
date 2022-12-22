import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/components/navigate.dart';
import 'package:socialapp/models/usermodel.dart';
import 'package:socialapp/pages/chat_details/chat_Details_Screen.dart';

import '../../cubit/home_cubit/social_cubit.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            body: ListView.separated(
                itemBuilder: (context, index) => allUsers(context,SocialCubit.get(context).allUsers[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount:SocialCubit.get(context).allUsers.length));
      },
    );
  }
}


Widget allUsers(context, UsersModel usersModel) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(onTap: () {

            navigateto(context: context, widget: ChatDetails(usersModel: usersModel,));
          },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 25,
                  backgroundImage:
                  NetworkImage('${usersModel.image}'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${usersModel.name} ',
                              style: const TextStyle(height: 1.3),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );