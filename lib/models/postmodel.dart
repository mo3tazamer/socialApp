class PostModel {
  String? name;
  String? image;
  String? date;
  String? uid;
  String? postImage;
  String? text;

  PostModel({
    this.name,
    this.uid,
    this.image,
    this.date,
    this.postImage,
    this.text,
  });

  PostModel.formjosn(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    image = json['image'];
    date = json['date'];
    postImage = json['postImage'];
    text = json['text'];
  }

  Map<String, dynamic> tomap() {
    return {
      'name': name ,
      'uid': uid ,
      'image': image ,
      'date': date ,
      'postImage': postImage ,
      'text': text
    };
  }
}
