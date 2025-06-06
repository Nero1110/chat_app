class Message {
  String message;
  String id;
  Message(this.message,this.id);
  factory Message.fromjson(json) {
    return Message(json['message'],json['id']);
  }
}
