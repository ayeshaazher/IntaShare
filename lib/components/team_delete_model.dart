import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'team_delete_widget.dart' show TeamDeleteWidget;
import 'package:flutter/material.dart';

class TeamDeleteModel extends FlutterFlowModel<TeamDeleteWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  TeamRecord? chatRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  ChatMessagesRecord? chatText;
  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  TeamRecord? showteam;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
