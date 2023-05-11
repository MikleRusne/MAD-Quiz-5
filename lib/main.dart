import 'package:flutter/material.dart';
import 'package:quiz5/home_page.dart';

import 'assignments_provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AssignmentsProvider(
        child: MaterialApp(
            title: 'Quiz 5, by Muhammad Muneeb',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.amber, primaryColorDark: Colors.orange),
            home: const HomePage(title: 'Quiz 5, by Muhammad Muneeb')));
  }
}
