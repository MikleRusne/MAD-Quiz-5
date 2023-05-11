import 'package:flutter/material.dart';
import 'package:rolodex/presenters/asignments_presenter.dart';
import 'assignment_details.dart';
import 'models/assignment.dart';

class AssignmentsList extends StatelessWidget {
  late List<Assignment> assignments;
  late AssignmentsPresenter assignmentsPresenter;

  AssignmentsList(
    this.assignments,
    this.assignmentsPresenter, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: assignments.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 40.0,
                          child: Text(assignments[index].title,
                              style: const TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          backgroundColor: const Color(0xFF20283e)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${assignments[index].id} ${assignments[index].title}",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                assignments[index].deadline,
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.green),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                assignments[index].status == 1
                                    ? 'Submitted'
                                    : 'Not submitted',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: (assignments[index].status == 1
                                        ? Colors.green
                                        : Colors.orange)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Color(0xFF167F67),
                            ),
                            onPressed: () => edit(assignments[index], context),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: Color(0xFF167F67)),
                            onPressed: () =>
                                assignmentsPresenter.delete(assignments[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  displayRecord() {
    assignmentsPresenter.updateScreen();
  }

  edit(Assignment contact, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          ContactDialog().build(context, this, true, contact),
    );
    assignmentsPresenter.updateScreen();
  }
}
