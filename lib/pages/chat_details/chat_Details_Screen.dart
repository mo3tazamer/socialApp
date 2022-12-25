import 'package:flutter/material.dart';
import 'package:socialapp/models/usermodel.dart';
import 'package:icon_broken/icon_broken.dart';

class ChatDetails extends StatelessWidget {
  ChatDetails({super.key, required this.usersModel});
  UsersModel usersModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              backgroundImage: NetworkImage('${usersModel.image}'),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10),
                      topStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    )),
                child: const Text('hii'),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[200]!.withOpacity(.5),
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(10),
                      topStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    )),
                child: const Text('hii'),
              ),
            ),
            const Spacer(),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                        hintText: 'enter message'),
                  )),
                  MaterialButton(height: 45,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    onPressed: () {},
                    color: Colors.blue,
                    child: const Icon(
                      IconBroken.Send,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
