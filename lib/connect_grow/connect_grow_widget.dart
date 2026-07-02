import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/components/manage_user_widget.dart';
import '/components/setting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'connect_grow_model.dart';
export 'connect_grow_model.dart';

class ConnectGrowWidget extends StatefulWidget {
  const ConnectGrowWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  static String routeName = 'connectGrow';
  static String routePath = '/connectGrow';

  @override
  State<ConnectGrowWidget> createState() => _ConnectGrowWidgetState();
}

class _ConnectGrowWidgetState extends State<ConnectGrowWidget> {
  late ConnectGrowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectGrowModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToListUser(currentUserReference!);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'u2oje7qd' /* Connect and Grow */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SettingWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/Instashare_2.png',
                            width: 48.0,
                            height: 48.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: FFAppState().connectUser(
                      requestFn: () => queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord
                            .where(
                              'uid',
                              isNotEqualTo: currentUserUid,
                            )
                            .orderBy('uid')
                            .orderBy('created_time', descending: true),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UsersRecord> listViewUsersRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          50.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: listViewUsersRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewUsersRecord =
                              listViewUsersRecordList[listViewIndex];
                          return Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              listViewUsersRecord.photoUrl,
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfwM2108oL7bhv9Ee8QQBC2dCng0jnV0kAow&s',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              listViewUsersRecord.displayName,
                                              'name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        48.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        wrapWithModel(
                                          model: _model.buttonModels1.getModel(
                                            listViewUsersRecord.uid,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ButtonWidget(
                                            key: Key(
                                              'Keywrv_${listViewUsersRecord.uid}',
                                            ),
                                            buttonColor: Color(0xFF2D84CB),
                                            textColor: Colors.white,
                                            text: 'Message',
                                            width: 135,
                                            height: 30,
                                            action: () async {
                                              // addUser
                                              _model.addToListUser(
                                                  listViewUsersRecord
                                                      .reference);
                                              safeSetState(() {});
                                              if (_model.listUser.length >= 2) {
                                                _model.storedata =
                                                    await queryChatsRecordOnce(
                                                  queryBuilder: (chatsRecord) =>
                                                      chatsRecord
                                                          .whereIn('user_a',
                                                              _model.listUser)
                                                          .where(
                                                            'team',
                                                            isEqualTo: false,
                                                          ),
                                                );
                                                while (_model.count! <
                                                    _model.storedata!.length) {
                                                  if ((currentUserUid ==
                                                          _model.storedata
                                                              ?.elementAtOrNull(
                                                                  _model.count!)
                                                              ?.users
                                                              .firstOrNull
                                                              ?.id) &&
                                                      (listViewUsersRecord
                                                              .reference.id ==
                                                          _model.storedata
                                                              ?.elementAtOrNull(
                                                                  _model.count!)
                                                              ?.users
                                                              .lastOrNull
                                                              ?.id)) {
                                                    // updateChat

                                                    await _model.storedata!
                                                        .elementAtOrNull(
                                                            _model.count!)!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'users':
                                                              _model.listUser,
                                                        },
                                                      ),
                                                    });
                                                    // updateChat
                                                    _model.updatedChatThread =
                                                        await queryChatsRecordOnce(
                                                      queryBuilder:
                                                          (chatsRecord) =>
                                                              chatsRecord.where(
                                                        'group_chat_id',
                                                        isEqualTo: _model
                                                            .storedata
                                                            ?.elementAtOrNull(
                                                                _model.count!)
                                                            ?.groupChatId,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      Chat2DetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          _model
                                                              .updatedChatThread,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatRef': _model
                                                            .updatedChatThread,
                                                      },
                                                    );
                                                  } else {
                                                    _model.count =
                                                        _model.count! + 1;
                                                    safeSetState(() {});
                                                  }
                                                }
                                                // newChat

                                                var chatsRecordReference =
                                                    ChatsRecord.collection
                                                        .doc();
                                                await chatsRecordReference.set({
                                                  ...createChatsRecordData(
                                                    userA: currentUserReference,
                                                    userB: _model.listUser
                                                        .elementAtOrNull(1),
                                                    lastMessage: '',
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    groupChatId: random_data
                                                        .randomInteger(
                                                            1000000, 9999999),
                                                    team: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'users': _model.listUser,
                                                    },
                                                  ),
                                                });
                                                _model.newChatThread =
                                                    ChatsRecord
                                                        .getDocumentFromData({
                                                  ...createChatsRecordData(
                                                    userA: currentUserReference,
                                                    userB: _model.listUser
                                                        .elementAtOrNull(1),
                                                    lastMessage: '',
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    groupChatId: random_data
                                                        .randomInteger(
                                                            1000000, 9999999),
                                                    team: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'users': _model.listUser,
                                                    },
                                                  ),
                                                }, chatsRecordReference);
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed(
                                                  Chat2DetailsWidget.routeName,
                                                  queryParameters: {
                                                    'chatRef': serializeParam(
                                                      _model.newChatThread,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'chatRef':
                                                        _model.newChatThread,
                                                  },
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'You must select at least one other user to start a chat.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .heebo(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3000),
                                                    backgroundColor:
                                                        Color(0xFF2D84CB),
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.buttonModels2.getModel(
                                            listViewUsersRecord.uid,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ButtonWidget(
                                            key: Key(
                                              'Keygau_${listViewUsersRecord.uid}',
                                            ),
                                            buttonColor: Color(0xFFEFEEEE),
                                            textColor: Color(0xFF2D84CB),
                                            text: 'invite',
                                            width: 135,
                                            height: 30,
                                            action: () async {
                                              _model.teamCount =
                                                  await queryTeamRecordCount(
                                                queryBuilder: (teamRecord) =>
                                                    teamRecord.where(
                                                  'teamAdmin',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
                                              );
                                              if ((_model.teamCount != null) &&
                                                  (_model.teamCount! > 0)) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.7,
                                                          child:
                                                              ManageUserWidget(
                                                            page: 'invite',
                                                            teamUserRef:
                                                                listViewUsersRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'You don\'t have a team first create It.',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
