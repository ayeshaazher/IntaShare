import '/backend/backend.dart';
import '/chat_groupwbubbles/empty_state_simple/empty_state_simple_widget.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
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

  bool containerBool = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in profile widget.
  UsersRecord? user;
  // Stores action output result for [Firestore Query - Query a collection] action in profile widget.
  BusinessRecord? business;
  // Model for button component.
  late ButtonModel buttonModel1;
  bool isDataUploading_uploadDataCover = false;
  FFUploadedFile uploadedLocalFile_uploadDataCover =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCover = '';

  // Model for button component.
  late ButtonModel buttonModel2;
  // Model for button component.
  late ButtonModel buttonModel3;
  // Model for button component.
  late ButtonModel buttonModel4;
  // Stores action output result for [Firestore Query - Query a collection] action in button widget.
  List<ChatsRecord>? storedata;
  // Stores action output result for [Firestore Query - Query a collection] action in button widget.
  ChatsRecord? updatedChatThread;
  // Stores action output result for [Backend Call - Create Document] action in button widget.
  ChatsRecord? newChatThread;
  // Model for button component.
  late ButtonModel buttonModel5;
  // Stores action output result for [Firestore Query - Query a collection] action in button widget.
  int? teamCount;
  // Model for button component.
  late ButtonModel buttonModel6;
  // Model for empty_state_Simple component.
  late EmptyStateSimpleModel emptyStateSimpleModel;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    buttonModel3 = createModel(context, () => ButtonModel());
    buttonModel4 = createModel(context, () => ButtonModel());
    buttonModel5 = createModel(context, () => ButtonModel());
    buttonModel6 = createModel(context, () => ButtonModel());
    emptyStateSimpleModel = createModel(context, () => EmptyStateSimpleModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
    buttonModel3.dispose();
    buttonModel4.dispose();
    buttonModel5.dispose();
    buttonModel6.dispose();
    emptyStateSimpleModel.dispose();
  }
}
