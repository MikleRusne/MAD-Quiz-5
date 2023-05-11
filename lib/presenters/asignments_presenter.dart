import 'dart:async';
import 'package:rolodex/data/database_helper.dart';
import 'package:rolodex/models/assignment.dart';
import 'package:rolodex/views/base_view.dart';

class AssignmentsPresenter {
  late final BaseView _view;

  AssignmentsPresenter();
  AssignmentsPresenter.withView(this._view);

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
