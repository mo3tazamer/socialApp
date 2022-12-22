part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialGetUserInitialState extends SocialState {}

class SocialGetUserLoadingState extends SocialState {}

class SocialGetUserSucsessState extends SocialState {}

class SocialGetUserErrorState extends SocialState {}
//##################################################

class SocialBottonNavState extends SocialState {}

//#####################################################
class SocialProFileImageSucsessState extends SocialState {}

class SocialProFileImageErrorState extends SocialState {}

//picker
class SocialCoverImageSucsessState extends SocialState {}

class SocialCoverImageErrorState extends SocialState {}

//##########################################################
class SocialUploadProfileImageSucsessState extends SocialState {}

class SocialUploadProfileImageErrorState extends SocialState {}

class SocialUploadCoverImageErrorState extends SocialState {}

class SocialUploadCoverImageSucsessState extends SocialState {}
//##############################################################

class SocialUpDateUserLoadingState extends SocialState {}

class SocialUpDateUserSucsessState extends SocialState {}

class SocialUpDateUserErrorState extends SocialState {}

//########################################################

class SocialUpDateUserImageLoadingState extends SocialState {}

class SocialUpDateUserImageSucsessState extends SocialState {}

class SocialUpDateUserImageErorrState extends SocialState {}

class SocialUpDateUserCoverLoadingState extends SocialState {}

class SocialUpDateUserCoverSucsessState extends SocialState {}

class SocialUpDateUserCoverErorrState extends SocialState {}

//#################################################################
//Create post
class SocialCreatePostLoadingState extends SocialState {}

class SocialCreatePostSucsessState extends SocialState {}

class SociaCreatePostErorrState extends SocialState {}

class SocialUploadPostImageLoadingState extends SocialState {}

class SocialUploadPostImageSucsessState extends SocialState {}

class SocialUploadPostImageErorrState extends SocialState {}

class SocialPostImageSucsessState extends SocialState {}

class SocialPostImageErrorState extends SocialState {}

class SocialPostImageRemoveState extends SocialState {}

class SocialGetPostsLoadingState extends SocialState {}

class SocialGetPostsSucsessState extends SocialState {}

class SocialGetPostsErrorState extends SocialState {}

class SocialGetLikesSucsessState extends SocialState {}

class SocialGetLikesErrorState extends SocialState {}

class SocialGetCommentSucsessState extends SocialState {}

class SocialGetCommentErrorState extends SocialState {}

//#############################################################
class SocialGetAllUserLoadingState extends SocialState {}

class SocialGetAllUserSucsessState extends SocialState {}

class SocialGetAllUserErrorState extends SocialState {}
