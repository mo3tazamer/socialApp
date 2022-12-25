class MessageModel {
  String? senderId;
  String? reciverId;
  String? Date;
  String? text;

  MessageModel({this.senderId, this.reciverId, this.Date, this.text});

  MessageModel.fromjson(Map<String, dynamic>json){

    senderId = json['senderId'];
    reciverId = json['receiverId'];
    Date = json['Date'];
    text = json['text'];

  }

  Map<String, dynamic>toMap(){

    return{
      'senderId': senderId,
      'receiverId': reciverId,
      'Date': Date,
      'text': text,



    };



  }
}
