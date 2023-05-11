import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rolodex/presenters/asignments_presenter.dart';
import 'models/assignment.dart';

class ContactDialog {
  final teTitle = TextEditingController();
  final teDeadline = TextEditingController();
  final teStatus = TextEditingController();
  late Assignment assignment;

  final AssignmentsPresenter assignmentsPresenter = AssignmentsPresenter();

  static const TextStyle linkStyle = TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  Widget build(
      BuildContext context, viewState, bool isEdit, Assignment? contact) {
    if (contact != null) {
      this.assignment = contact;
      teTitle.text = this.assignment.title;
      teDeadline.text = this.assignment.deadline;
      teStatus.text =
          this.assignment.status == 1 ? "Submitted" : "Not submitted";
    }

    return AlertDialog(
      title: Text(isEdit ? 'Edit assignment' : 'Add new assignment'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Enter title", teTitle),
            getTextField("Enter deadline", teDeadline),
            getTextField(
                "Enter submission (\"Submitted\"/\"Not submitted\")", teStatus),
            GestureDetector(
              onTap: () async {
                await saveAssignment(isEdit);
                viewState.displayRecord();
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButton(isEdit ? "Edit" : "Add",
                    const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: inputBoxController,
        decoration: InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );
    return loginBtn;
  }

  Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
    var loginBtn = Container(
      margin: margin,
      padding: const EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Text(
        buttonLabel,
        style: const TextStyle(
          color: Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return loginBtn;
  }

  Future saveAssignment(bool isEdit) async {
    var assignment = Assignment(
        // num.tryParse(teID.text) == null ? 0 : num.parse(teID.text),
        teTitle.text,
        teDeadline.text,
        teStatus.text == "Submitted" ? 1 : 0);

    if (isEdit && this.assignment.id != null) {
      assignment.setId(this.assignment.id!);
    }

    print("Saving ${assignment.title}");
    return assignmentsPresenter.save(assignment);
  }
}
