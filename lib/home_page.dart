import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rolodex/assignment_details.dart';
import 'package:rolodex/models/assignment.dart';
import 'package:rolodex/assignment_list.dart';
import 'package:rolodex/presenters/asignments_presenter.dart';
import 'package:rolodex/views/base_view.dart';
import 'views/base_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements BaseView {
  late AssignmentsPresenter contactsPresenter;

  @override
  void initState() {
    super.initState();
    contactsPresenter = AssignmentsPresenter.withView(this);
  }

  displayRecord() {
    setState(() {});
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment = CrossAxisAlignment.center;

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: const <Widget>[
            Text(
              'Contacts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _openAddUserDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          ContactDialog().build(context, this, false, null),
    );

    screenUpdate();
  }

  List<Widget> _buildActions() {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.group_add,
          color: Colors.white,
        ),
        onPressed: _openAddUserDialog,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: _buildTitle(context),
        title: Text("Ayyy"),
        actions: _buildActions(),
      ),
      body: FutureBuilder<List<Assignment>>(
        future: contactsPresenter.getAll(),
        builder: (context, snapshot) {
          return AssignmentsList(snapshot.data ?? [], contactsPresenter);
        },
      ),
    );
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}
