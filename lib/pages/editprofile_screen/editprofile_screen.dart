import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:socialapp/components/refactor.dart';
import 'package:socialapp/cubit/home_cubit/social_cubit.dart';

class EditProFile extends StatelessWidget {
  var name = TextEditingController();
  var bio = TextEditingController();
  var phone = TextEditingController();
  var fkey = GlobalKey<FormState>();

  EditProFile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit ProFile'),
            actions: [
              IconButton(
                  onPressed: () {
                    SocialCubit.get(context)
                        .upDateUserData(name.text, bio.text, phone.text);
                    // SocialCubit.get(context).upDateUserCoverImage();
                    //SocialCubit.get(context).upDateUserProFileImage();
                  },
                  icon: const Icon(IconBroken.Edit))
            ],
          ),
          body: BlocConsumer<SocialCubit, SocialState>(
            listener: (context, state) {
              if (state is SocialProFileImageSucsessState) {
                SocialCubit.get(context).upLoadProfileImage();
              }
              if (state is SocialUploadProfileImageSucsessState) {
                SocialCubit.get(context)
                    .upDateUserProFileImage(); // هبقى اعملها زرار لوحدها
              }

              if (state is SocialCoverImageSucsessState) {
                SocialCubit.get(context).upLoadCoverImage();
              }
              if (state is SocialUploadCoverImageSucsessState) {
                SocialCubit.get(context)
                    .upDateUserCoverImage(); // هبقى اعملها زرار لوحدها
              }
            },
            builder: (context, state) {
              var cubit = SocialCubit.get(context).usersModel;
              var profileImage = SocialCubit.get(context).profileImage;
              var coverImage = SocialCubit.get(context).coverImage;
              name.text = (SocialCubit.get(context).usersModel?.name)!;
              bio.text = (SocialCubit.get(context).usersModel?.bio)!;
              phone.text = (SocialCubit.get(context).usersModel?.phone)!;

              return Form(
                key: fkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 240,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                      height: 180,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: coverImage == null
                                                  ? NetworkImage(
                                                      '${cubit?.cover}',
                                                    )
                                                  : FileImage(coverImage)
                                                      as ImageProvider,
                                              fit: BoxFit.cover))),
                                  IconButton(
                                      onPressed: () {
                                        SocialCubit.get(context)
                                            .getCoverImage();
                                      },
                                      icon: const CircleAvatar(
                                          radius: 20,
                                          child: Icon(IconBroken.Camera))),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 73,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 70,
                                    backgroundImage: profileImage == null
                                        ? NetworkImage(
                                            '${cubit?.image}',
                                          )
                                        : FileImage(profileImage)
                                            as ImageProvider,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      SocialCubit.get(context)
                                          .getProfileImage();
                                    },
                                    icon: const CircleAvatar(
                                        radius: 20,
                                        child: Icon(IconBroken.Camera))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (state is SocialUpDateUserLoadingState)
                        const LinearProgressIndicator(),
                      defultFormField(
                        onTap: () {},
                        onchange: (_) {},
                        label: 'name',
                        obscureText: false,
                        hintText: 'enter name',
                        sufficons: const Icon(IconBroken.User),
                        controller: name,
                        validatormessage: '',
                      ),
                      defultFormField(
                        onTap: () {},
                        onchange: (_) {},
                        label: 'bio',
                        obscureText: false,
                        hintText: 'enter bio',
                        sufficons: const Icon(IconBroken.Bag),
                        controller: bio,
                        validatormessage: '',
                      ),
                      defultFormField(
                        onTap: () {},
                        onchange: (_) {},
                        label: 'phone',
                        obscureText: false,
                        hintText: 'enter phone',
                        sufficons: const Icon(IconBroken.Call),
                        controller: phone,
                        validatormessage: '',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
