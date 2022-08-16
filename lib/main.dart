import 'package:flutter/material.dart';
import 'package:newsfeed/home/presentation/home.dart';
import 'package:newsfeed/sources/presentation/source_detail_page.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        SourceDetailPage.sourceDetailPage: (context) =>
            const SourceDetailPage(),
      },
    );
  }
}
