class UsersModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? image;
  String? cover;
  String? bio;

  UsersModel({
    this.name,
    this.email,
    this.phone,
    this.uid,
    this.image,
    this.cover,
    this.bio,
  });

  UsersModel.formjosn(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'image': image,
      'cover': cover,
      'bio': bio,
    };
  }
}
