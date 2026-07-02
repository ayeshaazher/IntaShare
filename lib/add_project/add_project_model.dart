import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_project_widget.dart' show AddProjectWidget;
import 'package:flutter/material.dart';

class AddProjectModel extends FlutterFlowModel<AddProjectWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for jobTittle widget.
  FocusNode? jobTittleFocusNode;
  TextEditingController? jobTittleTextController;
  String? Function(BuildContext, String?)? jobTittleTextControllerValidator;
  String? _jobTittleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ig348uvv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for budget widget.
  FocusNode? budgetFocusNode;
  TextEditingController? budgetTextController;
  String? Function(BuildContext, String?)? budgetTextControllerValidator;
  String? _budgetTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l84e1ipt' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for duration widget.
  FocusNode? durationFocusNode;
  TextEditingController? durationTextController;
  String? Function(BuildContext, String?)? durationTextControllerValidator;
  String? _durationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c47rslzc' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  String? _detailsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r4ghfjjv' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading_uploadDataGfz1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataGfz1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataGfz1 = '';

  bool isDataUploading_uploadDataWut2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataWut2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataWut2 = '';

  bool isDataUploading_uploadDataT2w3 = false;
  FFUploadedFile uploadedLocalFile_uploadDataT2w3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataT2w3 = '';

  bool isDataUploading_uploadData72i4 = false;
  FFUploadedFile uploadedLocalFile_uploadData72i4 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData72i4 = '';

  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    jobTittleTextControllerValidator = _jobTittleTextControllerValidator;
    budgetTextControllerValidator = _budgetTextControllerValidator;
    durationTextControllerValidator = _durationTextControllerValidator;
    detailsTextControllerValidator = _detailsTextControllerValidator;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    jobTittleFocusNode?.dispose();
    jobTittleTextController?.dispose();

    budgetFocusNode?.dispose();
    budgetTextController?.dispose();

    durationFocusNode?.dispose();
    durationTextController?.dispose();

    detailsFocusNode?.dispose();
    detailsTextController?.dispose();

    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
