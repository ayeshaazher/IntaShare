import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contack_details_widget.dart' show ContackDetailsWidget;
import 'package:flutter/material.dart';

class ContackDetailsModel extends FlutterFlowModel<ContackDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p1kt66tq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '86uw4ckk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for homeadress widget.
  FocusNode? homeadressFocusNode;
  TextEditingController? homeadressTextController;
  String? Function(BuildContext, String?)? homeadressTextControllerValidator;
  String? _homeadressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '654h92t4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for whatsapp widget.
  FocusNode? whatsappFocusNode;
  TextEditingController? whatsappTextController;
  String? Function(BuildContext, String?)? whatsappTextControllerValidator;
  String? _whatsappTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'asytp8bq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for linkedin widget.
  FocusNode? linkedinFocusNode;
  TextEditingController? linkedinTextController;
  String? Function(BuildContext, String?)? linkedinTextControllerValidator;
  String? _linkedinTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'io53u7i8' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramTextController;
  String? Function(BuildContext, String?)? instagramTextControllerValidator;
  String? _instagramTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qvnf2ogb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for facebook widget.
  FocusNode? facebookFocusNode;
  TextEditingController? facebookTextController;
  String? Function(BuildContext, String?)? facebookTextControllerValidator;
  String? _facebookTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8keueqtb' /* Field is required */,
      );
    }

    return null;
  }

  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    phoneTextControllerValidator = _phoneTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    homeadressTextControllerValidator = _homeadressTextControllerValidator;
    whatsappTextControllerValidator = _whatsappTextControllerValidator;
    linkedinTextControllerValidator = _linkedinTextControllerValidator;
    instagramTextControllerValidator = _instagramTextControllerValidator;
    facebookTextControllerValidator = _facebookTextControllerValidator;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    homeadressFocusNode?.dispose();
    homeadressTextController?.dispose();

    whatsappFocusNode?.dispose();
    whatsappTextController?.dispose();

    linkedinFocusNode?.dispose();
    linkedinTextController?.dispose();

    instagramFocusNode?.dispose();
    instagramTextController?.dispose();

    facebookFocusNode?.dispose();
    facebookTextController?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
