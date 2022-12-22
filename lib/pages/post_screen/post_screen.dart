import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:socialapp/components/navigate.dart';
import 'package:socialapp/pages/home_screen/feeds.dart';

import '../../cubit/home_cubit/social_cubit.dart';

class NewPost extends StatelessWidget {
  NewPost({Key? key}) : super(key: key);
  var postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        if (state is SocialPostImageSucsessState) {
          SocialCubit.get(context).uploadPostImage();
        }
        if(state is SocialCreatePostSucsessState){
          SocialCubit.get(context).posts = [];
          SocialCubit.get(context).getPosts();


          navigateandfinish(widget:  Feeds(), context: context);

        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create Post'),
            actions: [
              TextButton(
                  onPressed: () {
                    SocialCubit.get(context).createUserPost(
                        text: postController.text,
                        date: DateTime.now().toString());
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23),
                    child: Text(
                      'Post',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 25,
                      backgroundImage: NetworkImage(
                          '${SocialCubit.get(context).usersModel?.image}'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                Text(
                                  '${SocialCubit.get(context).usersModel?.name} ',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Status'),
                    controller: postController,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Spacer(),
                if (SocialCubit.get(context).postImage != null)
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Image(
                          image: FileImage(SocialCubit.get(context).postImage!),
                        ),
                        IconButton(
                            onPressed: () {
                              SocialCubit.get(context).removePostImage();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 35,
                            ))
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          SocialCubit.get(context).getPostImage();
                        },
                        icon: const Icon(
                          IconBroken.Image,
                          size: 40,
                          color: Colors.blue,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          '# Tags',
                          style: TextStyle(fontSize: 25),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
