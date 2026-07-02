import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'connect_grow_widget.dart' show ConnectGrowWidget;
import 'package:flutter/material.dart';

class ConnectGrowModel extends FlutterFlowModel<ConnectGrowWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> listUser = [];
  void addToListUser(DocumentReference item) => listUser.add(item);
  void removeFromListUser(DocumentReference item) => listUser.remove(item);
  void removeAtIndexFromListUser(int index) => listUser.removeAt(index);
  void insertAtIndexInListUser(int index, DocumentReference item) =>
      listUser.insert(index, item);
  void updateListUserAtIndex(int index, Function(DocumentReference) updateFn) =>
      listUser[index] = updateFn(listUser[index]);

  int? count = 0;

  ///  State fields for stateful widgets in this page.

  // Models for button dynamic component.
  late FlutterFlowDynamicModels<ButtonModel> buttonModels1;
  // Stores action output result for [Firestore Query - Query a collection] action in button widget.
  List<ChatsRecord>? storedata;
  // Stores action output result for [Firestore Query - Query a collection] action in button widget.
  ChatsRecord? updatedChatThread;
  // Stores action output result for [Backend Call - Create Document] action in button widget.
  ChatsRecord? newChatThread;
  // Models for button dynamic component.
  late FlutterFlowDynamicModels<ButtonModel> buttonModels2;
  // Stores action output result for [Firestore Query - Query a collection] action in button widget.
  int? teamCount;

  @override
  void initState(BuildContext context) {
    buttonModels1 = FlutterFlowDynamicModels(() => ButtonModel());
    buttonModels2 = FlutterFlowDynamicModels(() => ButtonModel());
  }

  @override
  void dispose() {
    buttonModels1.dispose();
    buttonModels2.dispose();
  }
}
