import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_message_model.dart';
export 'admin_message_model.dart';

class AdminMessageWidget extends StatefulWidget {
  const AdminMessageWidget({
    super.key,
    required this.meetRef,
  });

  final DocumentReference? meetRef;

  @override
  State<AdminMessageWidget> createState() => _AdminMessageWidgetState();
}

class _AdminMessageWidgetState extends State<AdminMessageWidget> {
  late AdminMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminMessageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MeetingRecord>(
      stream: MeetingRecord.getDocument(widget.meetRef!),
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

        final containerMeetingRecord = snapshot.data!;

        return Container(
          width: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    containerMeetingRecord.message,
                    'Hey Team! We’re having a quick sync-up meeting! Let me know if you can make it.',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.heebo(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'vzlpvr28' /* Date: */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.heebo(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        TextSpan(
                          text: dateTimeFormat(
                            "yMMMd",
                            containerMeetingRecord.date!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.heebo(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.heebo(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'xk9d8v18' /* Time: */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.heebo(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        TextSpan(
                          text: dateTimeFormat(
                            "jm",
                            containerMeetingRecord.time!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.heebo(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.heebo(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'v65901od' /* Link/Location: */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.heebo(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        TextSpan(
                          text: containerMeetingRecord.link,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.heebo(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.heebo(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      wrapWithModel(
                        model: _model.buttonModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          buttonColor: Colors.white,
                          textColor: Colors.black,
                          text: 'Yes',
                          width: 70,
                          height: 32,
                          action: () async {
                            if (containerMeetingRecord.responses
                                .where((e) => e.memeber == currentUserReference)
                                .toList()
                                .isNotEmpty) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Respons Already Stored.',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            } else {
                              await widget.meetRef!.update({
                                ...mapToFirestore(
                                  {
                                    'responses': FieldValue.arrayUnion([
                                      getMeetResponseFirestoreData(
                                        createMeetResponseStruct(
                                          memeber: currentUserReference,
                                          response: 'Yes',
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            }
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.buttonModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          buttonColor: Colors.white,
                          textColor: Colors.black,
                          text: 'No',
                          width: 70,
                          height: 32,
                          action: () async {
                            if (containerMeetingRecord.responses
                                .where((e) => e.memeber == currentUserReference)
                                .toList()
                                .isNotEmpty) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Respons Already Stored.',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            } else {
                              await widget.meetRef!.update({
                                ...mapToFirestore(
                                  {
                                    'responses': FieldValue.arrayUnion([
                                      getMeetResponseFirestoreData(
                                        createMeetResponseStruct(
                                          memeber: currentUserReference,
                                          response: 'No',
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            }
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.buttonModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          buttonColor: Colors.white,
                          textColor: Colors.black,
                          text: 'Maybe',
                          width: 80,
                          height: 32,
                          action: () async {
                            if (containerMeetingRecord.responses
                                .where((e) => e.memeber == currentUserReference)
                                .toList()
                                .isNotEmpty) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Respons Already Stored.',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            } else {
                              await widget.meetRef!.update({
                                ...mapToFirestore(
                                  {
                                    'responses': FieldValue.arrayUnion([
                                      getMeetResponseFirestoreData(
                                        createMeetResponseStruct(
                                          memeber: currentUserReference,
                                          response: 'MayBe',
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '2n10v8jc' /* Looking forward to your respon... */,
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
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
