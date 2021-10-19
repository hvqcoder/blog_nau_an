class Joke {
  String? text;

  Joke();

  Joke.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }
}
