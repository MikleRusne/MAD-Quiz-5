import "package:flutter/material.dart";
import "package:quiz5/presenters/asignments_presenter.dart";
import "package:quiz5/views/base_view.dart";

class AssignmentsProvider extends InheritedWidget {
  final AssignmentsPresenter presenter;

  AssignmentsProvider({
    Key? key,
    required Widget child,
  })  : presenter = AssignmentsPresenter(),
        super(key: key, child: child);
  void SetBaseView(BaseView view) {
    this.presenter.SetView(view);
  }

  static AssignmentsProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AssignmentsProvider>();
  }

  @override
  bool updateShouldNotify(AssignmentsProvider oldWidget) {
    return presenter != oldWidget.presenter;
  }
}
