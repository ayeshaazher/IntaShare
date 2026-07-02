import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/components/manage_user_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_team_model.dart';
export 'add_team_model.dart';

class AddTeamWidget extends StatefulWidget {
  const AddTeamWidget({
    super.key,
    String? page,
    this.teamRef,
  }) : this.page = page ?? 'Add';

  final String page;
  final DocumentReference? teamRef;

  static String routeName = 'addTeam';
  static String routePath = '/addTeam';

  @override
  State<AddTeamWidget> createState() => _AddTeamWidgetState();
}

class _AddTeamWidgetState extends State<AddTeamWidget> {
  late AddTeamModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTeamModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
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
              Text(
                FFLocalizations.of(context).getText(
                  'auyyb373' /* New Team */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(28.0, 40.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '6zu6qmxk' /* Team Name */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.heebo(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF2D84CB),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22.0, 3.0, 22.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFFEFEEEE),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Colors.black,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      cursorColor: Colors.black,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                if (widget.page == 'add')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 30.0, 22.0, 0.0),
                    child: wrapWithModel(
                      model: _model.buttonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonWidget(
                        buttonColor: Color(0xFFFBAABD),
                        textColor: Colors.white,
                        text: 'Add Members',
                        width: 400,
                        height: 48,
                        action: () async {
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
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.8,
                                    child: ManageUserWidget(
                                      page: 'team',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.listuser = value));

                          _model.member = _model.listuser!
                              .toList()
                              .cast<DocumentReference>();
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(22.0, 30.0, 22.0, 0.0),
                  child: wrapWithModel(
                    model: _model.buttonModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ButtonWidget(
                      buttonColor: Color(0xFF2D84CB),
                      textColor: Colors.white,
                      text: 'Save',
                      width: 400,
                      height: 48,
                      action: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        if (widget.page == 'add') {
                          if (_model.member.length >= 1) {
                            _model.id = await actions.getID();
                            _model.addToMember(currentUserReference!);
                            safeSetState(() {});

                            var chatsRecordReference =
                                ChatsRecord.collection.doc();
                            await chatsRecordReference.set({
                              ...createChatsRecordData(
                                userA: currentUserReference,
                                lastMessage: 'Welcome to team Everyone.',
                                lastMessageTime: getCurrentTimestamp,
                                lastMessageSentBy: currentUserReference,
                                groupChatId:
                                    random_data.randomInteger(1000000, 9999999),
                                team: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'users': _model.member,
                                  'last_message_seen_by': [
                                    currentUserReference
                                  ],
                                },
                              ),
                            });
                            _model.chatRef = ChatsRecord.getDocumentFromData({
                              ...createChatsRecordData(
                                userA: currentUserReference,
                                lastMessage: 'Welcome to team Everyone.',
                                lastMessageTime: getCurrentTimestamp,
                                lastMessageSentBy: currentUserReference,
                                groupChatId:
                                    random_data.randomInteger(1000000, 9999999),
                                team: true,
                              ),
                              ...mapToFirestore(
                                {
                                  'users': _model.member,
                                  'last_message_seen_by': [
                                    currentUserReference
                                  ],
                                },
                              ),
                            }, chatsRecordReference);

                            var teamRecordReference =
                                TeamRecord.collection.doc();
                            await teamRecordReference.set({
                              ...createTeamRecordData(
                                teamId: _model.id?.toString(),
                                teamAdmin: currentUserReference,
                                teamName: _model.textController.text,
                                createdTime: getCurrentTimestamp,
                                chatRef: _model.chatRef?.reference,
                                hasRead: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'teamMembers': _model.member,
                                },
                              ),
                            });
                            _model.teamRef = TeamRecord.getDocumentFromData({
                              ...createTeamRecordData(
                                teamId: _model.id?.toString(),
                                teamAdmin: currentUserReference,
                                teamName: _model.textController.text,
                                createdTime: getCurrentTimestamp,
                                chatRef: _model.chatRef?.reference,
                                hasRead: false,
                              ),
                              ...mapToFirestore(
                                {
                                  'teamMembers': _model.member,
                                },
                              ),
                            }, teamRecordReference);
                            FFAppState().clearTeamsCache();
                            FFAppState().clearTeamNotificationCache();

                            context.pushNamed(
                              ClientDataBaseWidget.routeName,
                              queryParameters: {
                                'teamRef': serializeParam(
                                  _model.teamRef,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'teamRef': _model.teamRef,
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Team must have at least one memeber except Admin.',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }
                        } else {
                          await widget.teamRef!.update(createTeamRecordData(
                            teamName: _model.textController.text,
                          ));
                          FFAppState().clearTeamsCache();
                          FFAppState().clearTeamNotificationCache();

                          context.pushNamed(TeamManagementWidget.routeName);
                        }

                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
