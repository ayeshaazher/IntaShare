import '/components/side_nev_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat2_main_widget.dart' show Chat2MainWidget;
import 'package:flutter/material.dart';

class Chat2MainModel extends FlutterFlowModel<Chat2MainWidget> {
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
