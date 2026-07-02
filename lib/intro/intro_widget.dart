import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intro_model.dart';
export 'intro_model.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({super.key});

  static String routeName = 'intro';
  static String routePath = '/intro';

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  late IntroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroModel());

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.language_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 32.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowLanguageSelector(
                        width: 107.0,
                        height: 36.0,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        borderColor: Colors.transparent,
                        dropdownIconColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: 8.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.roboto(
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
                        hideFlags: true,
                        flagSize: 24.0,
                        flagTextGap: 8.0,
                        currentLanguage:
                            FFLocalizations.of(context).languageCode,
                        languages: FFLocalizations.languages(),
                        onChanged: (lang) => setAppLanguage(context, lang),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Instashare_2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '5ylumjtu' /* INSTASHARE */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.roboto(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 40.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(27.0, 45.0, 27.0, 0.0),
                child: wrapWithModel(
                  model: _model.buttonModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: ButtonWidget(
                    buttonColor: Color(0xFF2D84CB),
                    textColor: Colors.white,
                    text: 'Log in',
                    width: 400,
                    height: 48,
                    action: () async {
                      context.pushNamed(SignInWidget.routeName);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(27.0, 28.0, 27.0, 0.0),
                child: wrapWithModel(
                  model: _model.buttonModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: ButtonWidget(
                    buttonColor: Color(0xFFEFEEEE),
                    textColor: Colors.black,
                    text: 'Create Account',
                    width: 400,
                    height: 48,
                    action: () async {
                      context.pushNamed(SignUpWidget.routeName);
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
