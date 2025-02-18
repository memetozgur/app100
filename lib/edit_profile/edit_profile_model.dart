import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for displayname widget.
  FocusNode? displaynameFocusNode;
  TextEditingController? displaynameTextController;
  String? Function(BuildContext, String?)? displaynameTextControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  // State field(s) for parentphone widget.
  FocusNode? parentphoneFocusNode;
  TextEditingController? parentphoneTextController;
  String? Function(BuildContext, String?)? parentphoneTextControllerValidator;
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
    displaynameFocusNode?.dispose();
    displaynameTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    parentphoneFocusNode?.dispose();
    parentphoneTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
