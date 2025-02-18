import '/flutter_flow/flutter_flow_util.dart';
import 'recharge_wallet_widget.dart' show RechargeWalletWidget;
import 'package:flutter/material.dart';

class RechargeWalletModel extends FlutterFlowModel<RechargeWalletWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
