import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'intro_widget.dart' show IntroWidget;
import 'package:flutter/material.dart';

class IntroModel extends FlutterFlowModel<IntroWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
