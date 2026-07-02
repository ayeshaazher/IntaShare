import '/components/side_nev_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool count = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in home widget.
  int? taskCount;
  // Stores action output result for [Firestore Query - Query a collection] action in home widget.
  int? teamCount;
  // Model for sideNev component.
  late SideNevModel sideNevModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  int? teamsCount;

  @override
  void initState(BuildContext context) {
    sideNevModel = createModel(context, () => SideNevModel());
  }

  @override
  void dispose() {
    sideNevModel.dispose();
  }
}
