import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_message_widget.dart' show AdminMessageWidget;
import 'package:flutter/material.dart';

class AdminMessageModel extends FlutterFlowModel<AdminMessageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Model for button component.
  late ButtonModel buttonModel3;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
  }
}
