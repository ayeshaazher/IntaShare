import '/components/side_nev_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'team_management_widget.dart' show TeamManagementWidget;
import 'package:flutter/material.dart';

class TeamManagementModel extends FlutterFlowModel<TeamManagementWidget> {
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
