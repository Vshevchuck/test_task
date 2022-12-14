import 'package:flutter/material.dart';
import 'package:test_task/pages/image_page/image_page.dart';
import 'package:test_task/pages/main_page/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main': (context) => MainPage(),
        '/image': (context) => const ImagePage()
      },
      initialRoute: '/main',
    );
  }
}
