import '/flutter_flow/flutter_flow_util.dart';
import 'lesson_details_widget.dart' show LessonDetailsWidget;
import 'package:flutter/material.dart';

class LessonDetailsModel extends FlutterFlowModel<LessonDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for makepost widget.
  FocusNode? makepostFocusNode;
  TextEditingController? makepostTextController;
  String? Function(BuildContext, String?)? makepostTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    makepostFocusNode?.dispose();
    makepostTextController?.dispose();
  }
}
