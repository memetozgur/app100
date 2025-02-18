import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile_details_model.dart';
export 'profile_details_model.dart';

class ProfileDetailsWidget extends StatefulWidget {
  const ProfileDetailsWidget({super.key});

  @override
  State<ProfileDetailsWidget> createState() => _ProfileDetailsWidgetState();
}

class _ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
  late ProfileDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDetailsModel());

    _model.studentPhoneTextController ??= TextEditingController();
    _model.studentPhoneFocusNode ??= FocusNode();

    _model.parentPhoneTextController ??= TextEditingController();
    _model.parentPhoneFocusNode ??= FocusNode();

    _model.addressTextController ??= TextEditingController();
    _model.addressFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 75.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '2varwxta' /* معلوماتي الشخصية */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'elmesri',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'iczydkn5' /* يرجى التعريف عن نفسك  :-) */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'elmesri',
                                    color: Color(0xFF797979),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(22.0, 250.0, 22.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 320.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.studentPhoneTextController,
                            focusNode: _model.studentPhoneFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'mwcttqjc' /* رقم هاتف الطالب */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'elmesri',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              alignLabelWithHint: false,
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'elmesri',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'elmesri',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            validator: _model
                                .studentPhoneTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.parentPhoneTextController,
                            focusNode: _model.parentPhoneFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'rr2epl6x' /* رقم هاتف ولي الامر */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'elmesri',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              alignLabelWithHint: false,
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'elmesri',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'elmesri',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            validator: _model.parentPhoneTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.cityValueController ??=
                                  FormFieldController<String>(null),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'l9uxitvr' /* كركوك */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '04pz4zec' /* بغداد */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'rx4rh3q2' /* دهوك */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '3w5lsdik' /* اربيل */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ed32a7ab' /* نينوى */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6krgqr97' /* السليمانية */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mzhyyjbr' /* صلاح الدين */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '00in5ais' /* ديالى */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mrtp0re0' /* الانبار */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'iiyppv0u' /* واسط */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '7rst8vbi' /* بابل */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'nulkg14w' /* كربلاء */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'qho7nzlo' /* النجف */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'gch3siyl' /* الديوانية */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wstlo6cp' /* ميسان */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'c662ui3s' /* ذي قار */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'fcoiwkjg' /* المثنى */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'fdwj0kxw' /* البصرة */,
                                )
                              ],
                              onChanged: (val) =>
                                  safeSetState(() => _model.cityValue = val),
                              width: double.infinity,
                              height: 56.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'elmesri',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'n79olv9k' /* يرجى اختيار المحافظة */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.addressTextController,
                                focusNode: _model.addressFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'gyijcoig' /* عنوان السكن / اقرب نقطة دالة */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'elmesri',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                  alignLabelWithHint: false,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'elmesri',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'elmesri',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                validator: _model.addressTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 40.0),
                    child: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if ((_model.studentPhoneTextController.text !=
                                      '') &&
                              (_model.parentPhoneTextController.text !=
                                      '') &&
                              (_model.cityValue != null &&
                                  _model.cityValue != '') &&
                              (_model.addressTextController.text != '')) {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              studentPhone: int.tryParse(
                                  _model.studentPhoneTextController.text),
                              parentPhone: int.tryParse(
                                  _model.parentPhoneTextController.text),
                              city: _model.cityValue,
                              address: _model.addressTextController.text,
                            ));
                            await authManager.sendEmailVerification();

                            context.pushNamed('verify_email');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'يرجى ملئ جميع الحقول',
                                  style: TextStyle(
                                    fontFamily: 'tajwal400',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          '8fahd9l4' /* اكمال التسجيل */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF6130A9),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'elmesri',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
