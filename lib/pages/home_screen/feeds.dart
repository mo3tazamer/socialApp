import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:socialapp/models/postmodel.dart';
import '../../cubit/home_cubit/social_cubit.dart';



class Feeds extends StatelessWidget {
  Feeds({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: const [
                      Image(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/front-view-female-student-white-shirt-black-jacket-wearing-backpack-holding-files-with-copybooks-blue-wall-college-university-lessons_140725-43393.jpg?w=826&t=st=1670138795~exp=1670139395~hmac=f09589c2a99bd0c6efb241e73436c31f4883c26e67ea66a682910fe423829fbb',
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                      Text(
                        'communicte With Friends ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildPostIteams(
                        context, SocialCubit.get(context).posts[index], index),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: SocialCubit.get(context).posts.length)
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildPostIteams(context, PostModel model, index) {
  var commentText = TextEditingController();
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25,
                backgroundImage: NetworkImage(
                  '${model.image}',
                ),
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
                            '${model.name} ',
                            style: const TextStyle(height: 1.3),
                          ),
                          const Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16,
                          )
                        ],
                      ),
                      Text(
                        '${model.date} ',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 1.3),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                color: Colors.blue,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
          Text(
            '${model.text}.',
            style: const TextStyle(height: 1.4, fontSize: 16),
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              children: [
                InkWell(
                  child: const Text(
                    '#ontop',
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          if (model.postImage != '')
            Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                          '${model.postImage}',
                        ),
                        fit: BoxFit.cover))),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('${SocialCubit.get(context).likes[index]}',
                            style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        const Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${SocialCubit.get(context).comment[index]} comments',
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 16,
                  backgroundImage: NetworkImage(
                    '${SocialCubit.get(context).usersModel?.image}',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                      onSubmitted: (value) {
                        SocialCubit.get(context).writeComment(SocialCubit.get(context).postId[index],value);
                      },
                      controller: commentText,
                      decoration: InputDecoration(
                          hintText: 'write a comment.....',
                          contentPadding: const EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: (BorderRadius.circular(15))))),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      SocialCubit.get(context)
                          .likePost(SocialCubit.get(context).postId[index]);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          IconBroken.Heart,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Like', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}


