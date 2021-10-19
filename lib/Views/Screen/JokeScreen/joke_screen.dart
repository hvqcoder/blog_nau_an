import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pilot_app/ViewModels/joke_view_model.dart';

class JokeScreen extends StatefulWidget {
  final JokeViewModel _jokeViewModel;
  const JokeScreen(this._jokeViewModel, {Key? key}) : super(key: key);

  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  void initState() {
    super.initState();
    widget._jokeViewModel.getJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.joke ?? ''),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/splash_image.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder(
                      stream: widget._jokeViewModel.jokeSubject,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            widget._jokeViewModel.jokeSubject.value.toString(),
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          );
                        } else {
                          return const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          );
                        }
                      }),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(top: 16),
                    child: const Text(
                      '01/01/2021',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
