import '/flutter_flow/flutter_flow_util.dart';
import 'course_details_widget.dart' show CourseDetailsWidget;
import 'package:flutter/material.dart';

class CourseDetailsModel extends FlutterFlowModel<CourseDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
