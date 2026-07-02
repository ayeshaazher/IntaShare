import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_task_widget.dart' show AddTaskWidget;
import 'package:flutter/material.dart';

class AddTaskModel extends FlutterFlowModel<AddTaskWidget> {
  ///  Local state fields for this page.

  DateTime? date;

  DateTime? time;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z9yi95e4' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for button component.
  late ButtonModel buttonModel;
  // Stores action output result for [Custom Action - getID] action in button widget.
  int? id;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    buttonModel.dispose();
  }
}
