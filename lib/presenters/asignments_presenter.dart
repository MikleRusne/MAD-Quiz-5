import 'dart:async';
import 'package:quiz5/data/database_helper.dart';
import 'package:quiz5/models/assignment.dart';
import 'package:quiz5/views/base_view.dart';

class AssignmentsPresenter {
  late BaseView _view;

  AssignmentsPresenter();
  AssignmentsPresenter.withView(this._view);

  void SetView(BaseView _view) {
    this._view = _view;
  }

  Future<int> getCountSubmitted() async {
    return await DatabaseHelper.internal().getCompleted();
  }

  Future<int> getCountRemaining() async {
    return await DatabaseHelper.internal().getRemaining();
  }

  Future<List<Assignment>> getAll() async {
    print("Getting all");
    List<Map> list = await DatabaseHelper.internal().query("assignments");
    print("Query finished");
    List<Assignment> assignments = [];

    for (int i = 0; i < list.length; i++) {
      assignments.add(Assignment.map(list[i]));
      print("Added ${list[i]}");
    }

    return assignments;
  }

  save(Assignment assignment) async {
    if (assignment.id != null) {
      return DatabaseHelper.internal().update("assignments", assignment);
    }
    return DatabaseHelper.internal().insert("assignments", assignment);
  }

  delete(Assignment contact) async {
    // print(contact.id);
    await DatabaseHelper.internal().delete("assignments", contact);
    updateScreen();
  }

  updateScreen() {
    _view.screenUpdate();
  }
}
