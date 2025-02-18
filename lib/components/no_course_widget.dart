import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'no_course_model.dart';
export 'no_course_model.dart';

class NoCourseWidget extends StatefulWidget {
  const NoCourseWidget({super.key});

  @override
  State<NoCourseWidget> createState() => _NoCourseWidgetState();
}

class _NoCourseWidgetState extends State<NoCourseWidget> {
  late NoCourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoCourseModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 270.0,
        height: 270.0,
        decoration: BoxDecoration(),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Lottie.asset(
                  'assets/jsons/Animation_-_1715216335881.json',
                  width: 250.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'p62zn9qo' /* لا يوجد شئ حتى الان */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'elmesri',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
