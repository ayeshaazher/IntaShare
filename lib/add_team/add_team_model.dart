import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_team_widget.dart' show AddTeamWidget;
import 'package:flutter/material.dart';

class AddTeamModel extends FlutterFlowModel<AddTeamWidget> {
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jfdg4g8n' /* Field is required */,
      );
    }

    return null;
  }

  // Model for button component.
  late ButtonModel buttonModel1;
  // Stores action output result for [Bottom Sheet - manageUser] action in button widget.
  List<DocumentReference>? listuser;
  // Model for button component.
  late ButtonModel buttonModel2;
  // Stores action output result for [Custom Action - getID] action in button widget.
  int? id;
  // Stores action output result for [Backend Call - Create Document] action in button widget.
  ChatsRecord? chatRef;
  // Stores action output result for [Backend Call - Create Document] action in button widget.
  TeamRecord? teamRef;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
