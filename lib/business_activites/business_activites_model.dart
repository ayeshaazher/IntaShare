import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'business_activites_widget.dart' show BusinessActivitesWidget;
import 'package:flutter/material.dart';

class BusinessActivitesModel extends FlutterFlowModel<BusinessActivitesWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> member = [];
  void addToMember(DocumentReference item) => member.add(item);
  void removeFromMember(DocumentReference item) => member.remove(item);
  void removeAtIndexFromMember(int index) => member.removeAt(index);
  void insertAtIndexInMember(int index, DocumentReference item) =>
      member.insert(index, item);
  void updateMemberAtIndex(int index, Function(DocumentReference) updateFn) =>
      member[index] = updateFn(member[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in businessActivites widget.
  BusinessRecord? business;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0tnf5a1u' /* Field is required */,
      );
    }

    return null;
  }

  // Model for button component.
  late ButtonModel buttonModel;

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
