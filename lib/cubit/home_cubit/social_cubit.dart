import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/costants/const.dart';
import 'package:socialapp/models/usermodel.dart';
import 'package:socialapp/pages/home_screen/chat.dart';
import 'package:socialapp/pages/home_screen/feeds.dart';
import 'package:socialapp/pages/home_screen/setting.dart';
import 'dart:io';
import 'package:socialapp/pages/home_screen/users.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../models/postmodel.dart';
part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialGetUserInitialState());

  static SocialCubit get(context) => BlocProvider.of<SocialCubit>(context);

//##############################################################//
  //bottom navigation,
  int indexValue = 0;

  void bottomNavChange(index) {
    indexValue = index;
    emit(SocialBottonNavState());
  }

  List<Widget> screens = [
    Feeds(),
    const Chat(),
    const Users(),
    const Setting(),
  ];
  List<String> titles = [
    'Feeds',
    'Chat',
    'Users',
    'Settings',
  ];

  //###########################################################//
  // استقبال بيانات اليوزر
  // الصورة و الاسم و رقم الفون و البايو و صوره الكفر
  UsersModel? usersModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      usersModel = UsersModel.formjosn(value.data()!);
      emit(SocialGetUserSucsessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SocialGetUserErrorState());
    });
  }

  // #######################################################//
  // فتح الصور
  var piker = ImagePicker();
  File? profileImage;

  Future getProfileImage() async {
    var pikedFile = await piker.pickImage(source: ImageSource.gallery);

    if (pikedFile != null) {
      profileImage = File(pikedFile.path);
      emit(SocialProFileImageSucsessState());
    } else {
      emit(SocialProFileImageErrorState());

      print('no image selected.');
    }
  }

  File? coverImage;

  Future getCoverImage() async {
    var pikedFile = await piker.pickImage(source: ImageSource.gallery);

    if (pikedFile != null) {
      coverImage = File(pikedFile.path);
      emit(SocialCoverImageSucsessState());
    } else {
      emit(SocialCoverImageErrorState());

      print('no image selected.');
    }
  }

//##################################################################//
//##################################################################//
  // تحديث البروفيل
  String? proFileImageUploadedUrl; // رابط الصوره بعد الرفع ع الكلاود
  void upLoadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then(
      (value) {
        value.ref.getDownloadURL().then((value) {
          proFileImageUploadedUrl = value;
          emit(SocialUploadProfileImageSucsessState());
          print(value);
        }).catchError(
          (onError) {
            emit(SocialUploadProfileImageErrorState());
          },
        );
      },
    ).catchError(
      (onError) {
        emit(SocialUploadProfileImageErrorState());
      },
    );
  } // رفع صورة البروفيل على الكلاود

  void upDateUserProFileImage() {
    //emit(SocialUpDateUserImageLoadingState());

    FirebaseFirestore.instance
        .collection(
          'users',
        )
        .doc(
          uid,
        )
        .update(
      {'image': proFileImageUploadedUrl},
    ).then(
      (value) {
        getUserData();
        // print('issssssssssssssss${proFileImageUrl}');
      },
    ).catchError(
      (onError) {
        emit(SocialUpDateUserImageErorrState());
      },
    );
  } // استقبال الصورة

  String? coverImageUploadedUrl; // رابط الصوره بعد الرفع ع الكلاود
  void upLoadCoverImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then(
      (value) {
        value.ref.getDownloadURL().then(
          (value) {
            coverImageUploadedUrl = value;
            emit(SocialUploadCoverImageSucsessState());
            print(value);
          },
        ).catchError(
          (onError) {
            emit(SocialUploadCoverImageErrorState());
          },
        );
      },
    ).catchError(
      (onError) {
        emit(SocialUploadCoverImageErrorState());
      },
    );
  } // رفع الكفر على الكلاود

  void upDateUserCoverImage() {
    emit(SocialUpDateUserCoverLoadingState());

    FirebaseFirestore.instance
        .collection(
          'users',
        )
        .doc(
          uid,
        )
        .update(
      {'cover': coverImageUploadedUrl},
    ).then(
      (value) {
        getUserData();
        // print('issssssssssssssss${proFileImageUrl}');
      },
    ).catchError(
      (onError) {
        emit(SocialUpDateUserCoverErorrState());
      },
    );
  } // استقبال الصورة

  // تحديث الاسم و الفون و البايو
  void upDateUserData(
    String name,
    String bio,
    String phone,
  ) {
    emit(SocialUpDateUserLoadingState());

    UsersModel model = UsersModel(
        name: name,
        phone: phone,
        email: usersModel?.email,
        uid: uid,
        image:
            profileImage != null ? proFileImageUploadedUrl : usersModel?.image,
        cover: coverImage != null ? coverImageUploadedUrl : usersModel?.cover,
        bio: bio);

    FirebaseFirestore.instance
        .collection(
          'users',
        )
        .doc(
          uid,
        )
        .update(
          model.tomap(),
        )
        .then(
      (value) {
        getUserData();

        // print('issssssssssssssss${proFileImageUrl}');
      },
    ).catchError(
      (onError) {
        emit(SocialUpDateUserErrorState());
      },
    );
  }

  //##############################################################//

  File? postImage;
  String? postImageUploadedUrl;

  Future getPostImage() async {
    var pikedFile = await piker.pickImage(source: ImageSource.gallery);

    if (pikedFile != null) {
      postImage = File(pikedFile.path);
      emit(SocialPostImageSucsessState());
    } else {
      emit(SocialPostImageErrorState());

      print('no image selected.');
    }
  } // picker

  void uploadPostImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then(
      (value) {
        value.ref.getDownloadURL().then(
          (value) {
            postImageUploadedUrl = value;
            emit(SocialUploadPostImageSucsessState());
            print(value);
          },
        ).catchError(
          (onError) {
            emit(SocialUploadPostImageErorrState());
          },
        );
      },
    ).catchError(
      (onError) {
        emit(SocialUploadCoverImageErrorState());
      },
    );
  } // يرفع ع الكلاود

  void removePostImage() {
    postImage = null;
    emit(SocialPostImageRemoveState());
  }

  void createUserPost({
    required String date,
    required String text,
  }) {
    PostModel model = PostModel(
        image: usersModel?.image,
        uid: usersModel?.uid,
        name: usersModel?.name,
        date: date,
        postImage: postImageUploadedUrl ?? '',
        text: text);

    emit(SocialCreatePostLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.tomap())
        .then((value) {
      emit(SocialCreatePostSucsessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SociaCreatePostErorrState());
    });
  } // يرفع البوست

  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> likes = [];
  List<int> comment = [];

  void getPosts() {
    emit(SocialGetPostsLoadingState());
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      for (var element in value.docs) {
        element.reference.collection('like').get().then((value) {
          likes.add(value.docs.length);

          /*  PostModel postModel= PostModel(image: usersModel!.image,name:usersModel!.name, uid: usersModel!.uid);
          element.reference.update(postModel.tomap()) ;             يسمع معها الاسم الجديد كنت بحاول اعمل ابديت للبوست لو عدلت البروفيل*/
          postId.add(element.id);

          element.reference.collection('comment').get().then((value) {
            comment.add(value.docs.length);
            posts.add(PostModel.formjosn(element.data()));

            emit(SocialGetPostsSucsessState());
          }).catchError((onError) {});
        }).catchError((onError) {});
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(SocialGetPostsErrorState());
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('like')
        .doc(usersModel?.uid)
        .set({'like': true}).then((value) {
      emit(SocialGetLikesSucsessState());
    }).catchError((onError) {
      emit(SocialGetLikesErrorState());
    });
  }

  void writeComment(String postId, String text) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comment')
        .doc(usersModel?.uid)
        .set({'comment': text}).then((value) {
      emit(SocialGetCommentSucsessState());
    }).catchError((onError) {
      emit(SocialGetCommentErrorState());
    });
  }

  List<UsersModel> allUsers = [];
  void getAllUsers() {
    emit(SocialGetAllUserLoadingState());
    if (allUsers.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var element in value.docs) {
          if (element.data()['uid'] != usersModel!.uid) {
            allUsers.add(UsersModel.formjosn(element.data()));
          }
          emit(SocialGetAllUserSucsessState());
        }
      }).catchError((onError) {
        print(onError.toString());
        emit(SocialGetAllUserErrorState());//212

      });
    }
  }

























}
