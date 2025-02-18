import '/flutter_flow/flutter_flow_util.dart';
import 'query_orders_code_widget.dart' show QueryOrdersCodeWidget;
import 'package:flutter/material.dart';

class QueryOrdersCodeModel extends FlutterFlowModel<QueryOrdersCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for serial widget.
  FocusNode? serialFocusNode;
  TextEditingController? serialTextController;
  String? Function(BuildContext, String?)? serialTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    serialFocusNode?.dispose();
    serialTextController?.dispose();
  }
}
