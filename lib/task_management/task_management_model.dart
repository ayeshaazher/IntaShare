import '/components/side_nev_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'task_management_widget.dart' show TaskManagementWidget;
import 'package:flutter/material.dart';

class TaskManagementModel extends FlutterFlowModel<TaskManagementWidget> {
  ///  Local state fields for this page.

  bool? toggle = true;

  ///  State fields for stateful widgets in this page.

  // Model for sideNev component.
  late SideNevModel sideNevModel;

  @override
  void initState(BuildContext context) {
    sideNevModel = createModel(context, () => SideNevModel());
  }

  @override
  void dispose() {
    sideNevModel.dispose();
  }
}
