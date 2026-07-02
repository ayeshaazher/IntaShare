import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_sheet_widget.dart' show AdminSheetWidget;
import 'package:flutter/material.dart';

class AdminSheetModel extends FlutterFlowModel<AdminSheetWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for button component.
  late ButtonModel buttonModel;
  // Stores action output result for [Backend Call - Create Document] action in button widget.
  MeetingRecord? meetRef;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    buttonModel.dispose();
  }
}
