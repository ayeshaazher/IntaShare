import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button_model.dart';
export 'button_model.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    this.buttonColor,
    this.textColor,
    this.text,
    this.width,
    this.height,
    required this.action,
  });

  final Color? buttonColor;
  final Color? textColor;
  final String? text;
  final int? width;
  final int? height;
  final Future Function()? action;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late ButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.action?.call();
      },
      text: widget.text!,
      options: FFButtonOptions(
        width: widget.width?.toDouble(),
        height: widget.height?.toDouble(),
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget.buttonColor,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: widget.textColor,
              fontSize: 20.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 2.0,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
