class Message {
  int id;
  String content;
  bool winner;
  Message({
    required this.id,
    required this.content,
    required this.winner,
  });
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as int,
      content: json['text'] as String,
      winner: ((json['isWinner'] as int) == 1) ? true : false,
    );
  }
}
