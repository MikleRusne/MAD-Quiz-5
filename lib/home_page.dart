import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz5/assignment_details.dart';
import 'package:quiz5/assignments_provider.dart';
import 'package:quiz5/models/assignment.dart';
import 'package:quiz5/assignment_list.dart';
import 'package:quiz5/presenters/asignments_presenter.dart';
import 'package:quiz5/title.dart';
import 'package:quiz5/views/base_view.dart';
import 'views/base_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements BaseView {
  late AssignmentsPresenter assignmentsPresenter;

  @override
  void initState() {
    super.initState();
  }

  displayRecord() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assignmentsPresenter = AssignmentsProvider.of(context)!.presenter;
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
              'Assignments',
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
    AssignmentsProvider.of(context)?.SetBaseView(this);

    return Scaffold(
      appBar: AppBar(
        // title: _buildTitle(context),
        title: TitleWidget(),
        actions: _buildActions(),
      ),
      body: FutureBuilder<List<Assignment>>(
        future: assignmentsPresenter.getAll(),
        builder: (context, snapshot) {
          return AssignmentsList(snapshot.data ?? [], assignmentsPresenter);
        },
      ),
    );
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}
