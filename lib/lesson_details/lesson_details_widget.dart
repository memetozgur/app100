import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_course_widget.dart';
import '/components/reply_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'lesson_details_model.dart';
export 'lesson_details_model.dart';

class LessonDetailsWidget extends StatefulWidget {
  const LessonDetailsWidget({
    super.key,
    this.lessonprameters,
    this.comment1prameters,
  });

  final DocumentReference? lessonprameters;
  final CommentRecord? comment1prameters;

  @override
  State<LessonDetailsWidget> createState() => _LessonDetailsWidgetState();
}

class _LessonDetailsWidgetState extends State<LessonDetailsWidget>
    with TickerProviderStateMixin {
  late LessonDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonDetailsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.makepostTextController ??= TextEditingController();
    _model.makepostFocusNode ??= FocusNode();
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: StreamBuilder<LessonRecord>(
          stream: LessonRecord.getDocument(widget.lessonprameters!),
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
              children: [
                Stack(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(-0.0, 1.0),
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  22.0, 60.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 0.0,
                                      borderWidth: 0.0,
                                      buttonSize: 40.0,
                                      fillColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.safePop();
                                      },
                                    ),
                                    Text(
                                      stackLessonRecord.lessonNumber,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'elmesri',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: StreamBuilder<List<LessonDetailsRecord>>(
                                stream: queryLessonDetailsRecord(
                                  queryBuilder: (lessonDetailsRecord) =>
                                      lessonDetailsRecord
                                          .where(
                                            'lesson_number',
                                            isEqualTo: stackLessonRecord
                                                        .lessonNumber !=
                                                    ''
                                                ? stackLessonRecord.lessonNumber
                                                : null,
                                          )
                                          .where(
                                            'subject',
                                            isEqualTo:
                                                stackLessonRecord.subject != ''
                                                    ? stackLessonRecord.subject
                                                    : null,
                                          )
                                          .where(
                                            'teacher',
                                            isEqualTo:
                                                stackLessonRecord.teacher != ''
                                                    ? stackLessonRecord.teacher
                                                    : null,
                                          ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<LessonDetailsRecord>
                                      listViewLessonDetailsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final listViewLessonDetailsRecord =
                                      listViewLessonDetailsRecordList.isNotEmpty
                                          ? listViewLessonDetailsRecordList
                                              .first
                                          : null;

                                  return ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      FlutterFlowVideoPlayer(
                                        path: listViewLessonDetailsRecord!
                                            .videoUrl,
                                        videoType: VideoType.network,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: true,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Container(
                              height: 421.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'elmesri',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                      unselectedLabelStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'elmesri',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      padding: EdgeInsets.all(4.0),
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'pcaq2cjs' /* س / ج */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'vp33lbm8' /* مفات الدرس */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '94ie7sev' /* الملاحظات */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
                                          () async {},
                                          () async {}
                                        ][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: StreamBuilder<
                                                List<CommentRecord>>(
                                              stream: queryCommentRecord(
                                                queryBuilder: (commentRecord) =>
                                                    commentRecord
                                                        .where(
                                                          'lesson_number',
                                                          isEqualTo:
                                                              stackLessonRecord
                                                                  .lessonNumber,
                                                        )
                                                        .orderBy('dateA'),
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
                                                List<CommentRecord>
                                                    listViewCommentRecordList =
                                                    snapshot.data!;
                                                if (listViewCommentRecordList
                                                    .isEmpty) {
                                                  return Container(
                                                    height: double.infinity,
                                                    child: NoCourseWidget(),
                                                  );
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewCommentRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewCommentRecord =
                                                        listViewCommentRecordList[
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
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewCommentRecord
                                                                    .userAphoto,
                                                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewCommentRecord.userA,
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
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4.0,
                                                                                0.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                GradientText(
                                                                              listViewCommentRecord.isHeTeacher,
                                                                              textAlign: TextAlign.start,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            22.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            "relative",
                                                                            listViewCommentRecord.dateA!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'elmesri',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 8.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
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
                                                                        listViewCommentRecord
                                                                            .userAcomment,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            listViewCommentRecord.replycounter.length.toString(),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'elmesri',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(context).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: ReplyWidget(
                                                                                      commentprameters: listViewCommentRecord.reference,
                                                                                      lessonprameters: stackLessonRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '54n8rb79' /* رد */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'elmesri',
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          listViewCommentRecord
                                                                              .like
                                                                              .length
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                          onPressed:
                                                                              () async {
                                                                            final likeElement =
                                                                                currentUserReference;
                                                                            final likeUpdate = listViewCommentRecord.like.contains(likeElement)
                                                                                ? FieldValue.arrayRemove([
                                                                                    likeElement
                                                                                  ])
                                                                                : FieldValue.arrayUnion([
                                                                                    likeElement
                                                                                  ]);
                                                                            await listViewCommentRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'like': likeUpdate,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value: listViewCommentRecord
                                                                              .like
                                                                              .contains(currentUserReference),
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.favorite_rounded,
                                                                            color:
                                                                                Color(0xFF6130A9),
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                25.0,
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
                                        ),
                                        Stack(
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

                                                final stackLessonRecord =
                                                    snapshot.data!;

                                                return Stack(
                                                  children: [
                                                    StreamBuilder<
                                                        List<LesFileRecord>>(
                                                      stream:
                                                          queryLesFileRecord(
                                                        queryBuilder:
                                                            (lesFileRecord) =>
                                                                lesFileRecord
                                                                    .where(
                                                                      'lesson_number',
                                                                      isEqualTo:
                                                                          stackLessonRecord
                                                                              .lessonNumber,
                                                                    )
                                                                    .where(
                                                                      'subject',
                                                                      isEqualTo:
                                                                          stackLessonRecord
                                                                              .subject,
                                                                    )
                                                                    .where(
                                                                      'teacher_of_subject',
                                                                      isEqualTo:
                                                                          stackLessonRecord
                                                                              .teacher,
                                                                    )
                                                                    .orderBy(
                                                                        'post_time'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<LesFileRecord>
                                                            listViewLesFileRecordList =
                                                            snapshot.data!;
                                                        if (listViewLesFileRecordList
                                                            .isEmpty) {
                                                          return NoCourseWidget();
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewLesFileRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewLesFileRecord =
                                                                listViewLesFileRecordList[
                                                                    listViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          22.0,
                                                                          8.0,
                                                                          22.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 85.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEAECED),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.picture_as_pdf_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 36.0,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            listViewLesFileRecord.nameFile,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'elmesri',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            55.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL(listViewLesFileRecord.pdfUrl);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'v5fzbbj9' /* اضغط هنا لفتح الملف */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'elmesri',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        StreamBuilder<List<LessonNotesRecord>>(
                                          stream: queryLessonNotesRecord(
                                            queryBuilder: (lessonNotesRecord) =>
                                                lessonNotesRecord
                                                    .where(
                                                      'lesson_number',
                                                      isEqualTo:
                                                          stackLessonRecord
                                                              .lessonNumber,
                                                    )
                                                    .where(
                                                      'subject',
                                                      isEqualTo:
                                                          stackLessonRecord
                                                              .subject,
                                                    )
                                                    .where(
                                                      'teacher',
                                                      isEqualTo:
                                                          stackLessonRecord
                                                              .teacher,
                                                    ),
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
                                            List<LessonNotesRecord>
                                                listViewLessonNotesRecordList =
                                                snapshot.data!;
                                            if (listViewLessonNotesRecordList
                                                .isEmpty) {
                                              return NoCourseWidget();
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewLessonNotesRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewLessonNotesRecord =
                                                    listViewLessonNotesRecordList[
                                                        listViewIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                0.0,
                                                                12.0),
                                                    child: Container(
                                                      width: 350.0,
                                                      height: 300.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      listViewLessonNotesRecord
                                                                          .lessonNoteImage,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: listViewLessonNotesRecord
                                                                        .lessonNoteImage,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag: listViewLessonNotesRecord
                                                                  .lessonNoteImage,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  listViewLessonNotesRecord
                                                                      .lessonNoteImage,
                                                                  width: 300.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                listViewLessonNotesRecord
                                                                    .lessoneNoteName,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'elmesri',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 4.0),
                            child: Container(
                              width: double.infinity,
                              height: 75.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 0.0,
                                          buttonSize: 40.0,
                                          fillColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.send_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await CommentRecord.collection
                                                .doc()
                                                .set(createCommentRecordData(
                                                  userA: currentUserDisplayName,
                                                  userAphoto: currentUserPhoto,
                                                  userAcomment: _model
                                                      .makepostTextController
                                                      .text,
                                                  dateA: getCurrentTimestamp,
                                                  lessonNumber:
                                                      stackLessonRecord
                                                          .lessonNumber,
                                                  commentId:
                                                      random_data.randomInteger(
                                                          11111111, 99999999),
                                                  isHeTeacher:
                                                      valueOrDefault<String>(
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.isHeTeacher,
                                                        ''),
                                                    '.',
                                                  ),
                                                ));
                                            safeSetState(() {
                                              _model.makepostTextController
                                                  ?.clear();
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                    arText: 'تم التعليق بنجاح',
                                                    enText: 'Comment done',
                                                    trText: 'Yorum yapıldı',
                                                  ),
                                                  style: TextStyle(
                                                    fontFamily: 'elmesri',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    Color(0xFF61309A),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'btbpkds4' /* ارسال */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'elmesri',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.makepostTextController,
                                        focusNode: _model.makepostFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'otpffder' /* أسأل سؤالك هنا ..  */,
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
                                                    fontFamily: 'tajwal400',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'elmesri',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        textAlign: TextAlign.start,
                                        validator: _model
                                            .makepostTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
