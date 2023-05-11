import 'package:flutter/material.dart';
import 'package:rolodex/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz 5, by Muhammad Muneeb',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.amber, primaryColorDark: Colors.orange),
        home: const HomePage(title: 'Quiz 5, by Muhammad Muneeb'));
  }
}
