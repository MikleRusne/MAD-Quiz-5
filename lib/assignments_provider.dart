import "package:flutter/material.dart";
import "package:rolodex/presenters/asignments_presenter.dart";

class AssignmentsProvider extends InheritedWidget {
  final AssignmentsPresenter presenter;

  AssignmentsProvider({
    Key? key,
    required this.presenter,
    required Widget child,
  }) : super(key: key, child: child);

  static AssignmentsProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AssignmentsProvider>();
  }

  @override
  bool updateShouldNotify(AssignmentsProvider oldWidget) {
    return presenter != oldWidget.presenter;
  }
}
