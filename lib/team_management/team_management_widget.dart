import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_groupwbubbles/empty_state_simple/empty_state_simple_widget.dart';
import '/components/setting_widget.dart';
import '/components/side_nev_widget.dart';
import '/components/team_delete_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'team_management_model.dart';
export 'team_management_model.dart';

class TeamManagementWidget extends StatefulWidget {
  const TeamManagementWidget({super.key});

  static String routeName = 'teamManagement';
  static String routePath = '/teamManagement';

  @override
  State<TeamManagementWidget> createState() => _TeamManagementWidgetState();
}

class _TeamManagementWidgetState extends State<TeamManagementWidget> {
  late TeamManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamManagementModel());

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'cu0j1yj2' /* Team Management */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                  ),
                ],
              ),
              InkWell(
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
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              wrapWithModel(
                model: _model.sideNevModel,
                updateCallback: () => safeSetState(() {}),
                child: SideNevWidget(
                  nevSelected: 3,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 18.0, 0.0),
                        child: FutureBuilder<int>(
                          future: queryTeamRecordCount(
                            queryBuilder: (teamRecord) => teamRecord.where(
                              'teamAdmin',
                              isEqualTo: currentUserReference,
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
                            int iconCount = snapshot.data!;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (iconCount < 2) {
                                  context.pushNamed(
                                    AddTeamWidget.routeName,
                                    queryParameters: {
                                      'page': serializeParam(
                                        'add',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.isPro, false)) {
                                    context.pushNamed(
                                      AddTeamWidget.routeName,
                                      queryParameters: {
                                        'page': serializeParam(
                                          'add',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(ProPlanWidget.routeName);
                                  }
                                }
                              },
                              child: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                        child: StreamBuilder<List<TeamRecord>>(
                          stream: FFAppState().teams(
                            requestFn: () => queryTeamRecord(
                              queryBuilder: (teamRecord) => teamRecord
                                  .where(
                                    'teamMembers',
                                    arrayContains: currentUserReference,
                                  )
                                  .orderBy('createdTime'),
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
                            List<TeamRecord> listViewTeamRecordList =
                                snapshot.data!;
                            if (listViewTeamRecordList.isEmpty) {
                              return Center(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: EmptyStateSimpleWidget(
                                    icon: Icon(
                                      FFIcons.kgroup,
                                      color: Color(0xFF2D84CB),
                                      size: 50.0,
                                    ),
                                    title: FFLocalizations.of(context).getText(
                                      '00g97d43' /* Team Record */,
                                    ),
                                    body: FFLocalizations.of(context).getText(
                                      '52pntkyr' /* No team created yet */,
                                    ),
                                  ),
                                ),
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                50.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: listViewTeamRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewTeamRecord =
                                    listViewTeamRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 12.0),
                                  child: StreamBuilder<ChatsRecord>(
                                    stream: ChatsRecord.getDocument(
                                        listViewTeamRecord.chatRef!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final containerChatsRecord =
                                          snapshot.data!;

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await listViewTeamRecord.reference
                                              .update(createTeamRecordData(
                                            hasRead: true,
                                          ));

                                          context.pushNamed(
                                            Chat2DetailsWidget.routeName,
                                            queryParameters: {
                                              'chatRef': serializeParam(
                                                containerChatsRecord,
                                                ParamType.Document,
                                              ),
                                              'team': serializeParam(
                                                listViewTeamRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'chatRef': containerChatsRecord,
                                              'team': listViewTeamRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEFEEEE),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  listViewTeamRecord.teamName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.heebo(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                if (listViewTeamRecord
                                                        .teamAdmin ==
                                                    currentUserReference)
                                                  Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    TeamDeleteWidget(
                                                                  teamRef:
                                                                      listViewTeamRecord
                                                                          .reference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        color: Colors.black,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
            ],
          ),
        ),
      ),
    );
  }
}
