import '/backend/backend.dart';
import '/components/admin_message_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'chat_thread_update_widget.dart' show ChatThreadUpdateWidget;
import 'package:flutter/material.dart';

class ChatThreadUpdateModel extends FlutterFlowModel<ChatThreadUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for adminMessage component.
  late AdminMessageModel adminMessageModel1;
  // Model for adminMessage component.
  late AdminMessageModel adminMessageModel2;

  /// Query cache managers for this widget.

  final _chatUserManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> chatUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _chatUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatUserCache() => _chatUserManager.clear();
  void clearChatUserCacheKey(String? uniqueKey) =>
      _chatUserManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    adminMessageModel1 = createModel(context, () => AdminMessageModel());
    adminMessageModel2 = createModel(context, () => AdminMessageModel());
  }

  @override
  void dispose() {
    adminMessageModel1.dispose();
    adminMessageModel2.dispose();

    /// Dispose query cache managers for this widget.

    clearChatUserCache();
  }
}
