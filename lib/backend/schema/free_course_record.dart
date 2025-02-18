import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FreeCourseRecord extends FirestoreRecord {
  FreeCourseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "course_teacher" field.
  String? _courseTeacher;
  String get courseTeacher => _courseTeacher ?? '';
  bool hasCourseTeacher() => _courseTeacher != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "course_title" field.
  String? _courseTitle;
  String get courseTitle => _courseTitle ?? '';
  bool hasCourseTitle() => _courseTitle != null;

  void _initializeFields() {
    _courseTeacher = snapshotData['course_teacher'] as String?;
    _stage = snapshotData['stage'] as String?;
    _subject = snapshotData['subject'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _courseTitle = snapshotData['course_title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('free_course');

  static Stream<FreeCourseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FreeCourseRecord.fromSnapshot(s));

  static Future<FreeCourseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FreeCourseRecord.fromSnapshot(s));

  static FreeCourseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FreeCourseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FreeCourseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FreeCourseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FreeCourseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FreeCourseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFreeCourseRecordData({
  String? courseTeacher,
  String? stage,
  String? subject,
  String? videoUrl,
  String? courseTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_teacher': courseTeacher,
      'stage': stage,
      'subject': subject,
      'video_url': videoUrl,
      'course_title': courseTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class FreeCourseRecordDocumentEquality implements Equality<FreeCourseRecord> {
  const FreeCourseRecordDocumentEquality();

  @override
  bool equals(FreeCourseRecord? e1, FreeCourseRecord? e2) {
    return e1?.courseTeacher == e2?.courseTeacher &&
        e1?.stage == e2?.stage &&
        e1?.subject == e2?.subject &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.courseTitle == e2?.courseTitle;
  }

  @override
  int hash(FreeCourseRecord? e) => const ListEquality().hash(
      [e?.courseTeacher, e?.stage, e?.subject, e?.videoUrl, e?.courseTitle]);

  @override
  bool isValidKey(Object? o) => o is FreeCourseRecord;
}
