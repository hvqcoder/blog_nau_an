import 'package:pilot_app/Models/joke.dart';
import 'package:pilot_app/Service/joke_data_source.dart';
import 'package:rxdart/rxdart.dart';

class JokeViewModel {
  BehaviorSubject<Joke> jokeSubject = BehaviorSubject();

  JokeViewModel();

  JokeDataSource req = JokeDataSource();

  void getJoke() async {
    Joke data = await req.getJoke();
    jokeSubject.sink.add(data);
  }

  void dispose() {
    jokeSubject.close();
  }
}
