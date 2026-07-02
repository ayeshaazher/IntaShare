import '/flutter_flow/flutter_flow_util.dart';
import 'manage_user_widget.dart' show ManageUserWidget;
import 'package:flutter/material.dart';

class ManageUserModel extends FlutterFlowModel<ManageUserWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> listUser = [];
  void addToListUser(DocumentReference item) => listUser.add(item);
  void removeFromListUser(DocumentReference item) => listUser.remove(item);
  void removeAtIndexFromListUser(int index) => listUser.removeAt(index);
  void insertAtIndexInListUser(int index, DocumentReference item) =>
      listUser.insert(index, item);
  void updateListUserAtIndex(int index, Function(DocumentReference) updateFn) =>
      listUser[index] = updateFn(listUser[index]);

  String teambutton = 'Add';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  int? team;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
