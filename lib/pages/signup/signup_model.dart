import '/flutter_flow/flutter_flow_util.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for passwordconfirm widget.
  FocusNode? passwordconfirmFocusNode;
  TextEditingController? passwordconfirmTextController;
  late bool passwordconfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordconfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordconfirmVisibility = false;
  }

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordconfirmFocusNode?.dispose();
    passwordconfirmTextController?.dispose();
  }
}
