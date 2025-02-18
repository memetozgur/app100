import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'reply_model.dart';
export 'reply_model.dart';

class ReplyWidget extends StatefulWidget {
  const ReplyWidget({
    super.key,
    this.commentprameters,
    this.lessonprameters,
  });

  final DocumentReference? commentprameters;
  final DocumentReference? lessonprameters;

  @override
  State<ReplyWidget> createState() => _ReplyWidgetState();
}

class _ReplyWidgetState extends State<ReplyWidget> {
  late ReplyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReplyModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StreamBuilder<CommentRecord>(
                  stream: CommentRecord.getDocument(widget.commentprameters!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }

                    final stackCommentRecord = snapshot.data!;

                    return Stack(
                      children: [
                        StreamBuilder<LessonRecord>(
                          stream: LessonRecord.getDocument(
                              widget.lessonprameters!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final stackLessonRecord = snapshot.data!;

                            return Stack(
                              alignment: AlignmentDirectional(-0.0, 1.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 500.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 8.0, 12.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 0.0,
                                                buttonSize: 40.0,
                                                fillColor: Colors.transparent,
                                                icon: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 90.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: StreamBuilder<
                                                    List<ReplyCommentRecord>>(
                                                  stream:
                                                      queryReplyCommentRecord(
                                                    queryBuilder:
                                                        (replyCommentRecord) =>
                                                            replyCommentRecord
                                                                .where(
                                                                  'lesson',
                                                                  isEqualTo:
                                                                      stackLessonRecord
                                                                          .lessonNumber,
                                                                )
                                                                .where(
                                                                  'comment_id_reply',
                                                                  isEqualTo:
                                                                      stackCommentRecord
                                                                          .commentId,
                                                                )
                                                                .orderBy('time',
                                                                    descending:
                                                                        true),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ReplyCommentRecord>
                                                        listViewReplyCommentRecordList =
                                                        snapshot.data!;

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewReplyCommentRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewReplyCommentRecord =
                                                            listViewReplyCommentRecordList[
                                                                listViewIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      8.0,
                                                                      12.0,
                                                                      20.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  listViewReplyCommentRecord
                                                                      .image,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                listViewReplyCommentRecord.name,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'elmesri',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
                                                                                child: GradientText(
                                                                                  listViewReplyCommentRecord.teachrORnot,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'elmesri',
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                  colors: [
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                    FlutterFlowTheme.of(context).secondary
                                                                                  ],
                                                                                  gradientDirection: GradientDirection.ltr,
                                                                                  gradientType: GradientType.linear,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 22.0, 0.0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "relative",
                                                                                  listViewReplyCommentRecord.time!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'elmesri',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              20.0,
                                                                              22.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewReplyCommentRecord.commenttext,
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'elmesri',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              listViewReplyCommentRecord.like.length.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'elmesri',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                22.0,
                                                                                0.0),
                                                                            child:
                                                                                ToggleIcon(
                                                                              onPressed: () async {
                                                                                final likeElement = currentUserReference;
                                                                                final likeUpdate = listViewReplyCommentRecord.like.contains(likeElement)
                                                                                    ? FieldValue.arrayRemove([
                                                                                        likeElement
                                                                                      ])
                                                                                    : FieldValue.arrayUnion([
                                                                                        likeElement
                                                                                      ]);
                                                                                await listViewReplyCommentRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'like': likeUpdate,
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              },
                                                                              value: listViewReplyCommentRecord.like.contains(currentUserReference),
                                                                              onIcon: Icon(
                                                                                Icons.star_sharp,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                size: 25.0,
                                                                              ),
                                                                              offIcon: Icon(
                                                                                Icons.star_border,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 25.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 10.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await ReplyCommentRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        createReplyCommentRecordData(
                                                      name:
                                                          currentUserDisplayName,
                                                      image: currentUserPhoto,
                                                      commenttext: _model
                                                          .textController.text,
                                                      time: getCurrentTimestamp,
                                                      lesson: stackCommentRecord
                                                          .lessonNumber,
                                                      commentIdReply:
                                                          stackCommentRecord
                                                              .commentId,
                                                      teachrORnot:
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.isHeTeacher,
                                                              ''),
                                                    ));

                                                await stackCommentRecord
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'replycounter': FieldValue
                                                          .arrayUnion([
                                                        random_data
                                                            .randomInteger(
                                                                100, 10000)
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              },
                                              child: Icon(
                                                Icons.send,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 28.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5bfcuyl4' /* ارسال */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'elmesri',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 12.0),
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '91e1do66' /* رد على التعليق .. */,
                                              ),
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'elmesri',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'elmesri',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'elmesri',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
