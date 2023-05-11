import 'package:flutter/material.dart';
import 'package:quiz5/presenters/asignments_presenter.dart';

import 'assignments_provider.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  late AssignmentsPresenter assignmentsPresenter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assignmentsPresenter = AssignmentsProvider.of(context)!.presenter;
  }

  @override
  Widget build(BuildContext context) {
    var horizontalTitleAlignment = CrossAxisAlignment.center;
    assignmentsPresenter = AssignmentsProvider.of(context)!.presenter;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            const Text(
              'Assignments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FutureBuilder<int>(
                  future: this.assignmentsPresenter.getCountSubmitted(),
                  builder: (context, snapshot) {
                    return Text(
                        "Completed: " +
                            (snapshot.connectionState == ConnectionState.done
                                ? snapshot.data.toString()
                                : "Loading"),
                        style: const TextStyle(color: Colors.green));
                  }),
              FutureBuilder<int>(
                  future: this.assignmentsPresenter.getCountRemaining(),
                  builder: (context, snapshot) {
                    return Text(
                        "Remaining: " +
                            (snapshot.connectionState == ConnectionState.done
                                ? snapshot.data.toString()
                                : "Loading"),
                        style: const TextStyle(color: Colors.red));
                  })
            ])
          ],
        ),
      ),
    );
  }
}
