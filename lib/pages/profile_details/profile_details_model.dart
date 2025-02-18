import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_details_widget.dart' show ProfileDetailsWidget;
import 'package:flutter/material.dart';

class ProfileDetailsModel extends FlutterFlowModel<ProfileDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for student_phone widget.
  FocusNode? studentPhoneFocusNode;
  TextEditingController? studentPhoneTextController;
  String? Function(BuildContext, String?)? studentPhoneTextControllerValidator;
  // State field(s) for parent_phone widget.
  FocusNode? parentPhoneFocusNode;
  TextEditingController? parentPhoneTextController;
  String? Function(BuildContext, String?)? parentPhoneTextControllerValidator;
  // State field(s) for city widget.
  String? cityValue;
  FormFieldController<String>? cityValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    studentPhoneFocusNode?.dispose();
    studentPhoneTextController?.dispose();

    parentPhoneFocusNode?.dispose();
    parentPhoneTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
