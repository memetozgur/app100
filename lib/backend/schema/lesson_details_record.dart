import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonDetailsRecord extends FirestoreRecord {
  LessonDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "lesson_number" field.
  String? _lessonNumber;
  String get lessonNumber => _lessonNumber ?? '';
  bool hasLessonNumber() => _lessonNumber != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "teacher" field.
  String? _teacher;
  String get teacher => _teacher ?? '';
  bool hasTeacher() => _teacher != null;

  void _initializeFields() {
    _videoUrl = snapshotData['video_url'] as String?;
    _lessonNumber = snapshotData['lesson_number'] as String?;
    _subject = snapshotData['subject'] as String?;
    _teacher = snapshotData['teacher'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lesson_details');

  static Stream<LessonDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonDetailsRecord.fromSnapshot(s));

  static Future<LessonDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonDetailsRecord.fromSnapshot(s));

  static LessonDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonDetailsRecordData({
  String? videoUrl,
  String? lessonNumber,
  String? subject,
  String? teacher,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_url': videoUrl,
      'lesson_number': lessonNumber,
      'subject': subject,
      'teacher': teacher,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonDetailsRecordDocumentEquality
    implements Equality<LessonDetailsRecord> {
  const LessonDetailsRecordDocumentEquality();

  @override
  bool equals(LessonDetailsRecord? e1, LessonDetailsRecord? e2) {
    return e1?.videoUrl == e2?.videoUrl &&
        e1?.lessonNumber == e2?.lessonNumber &&
        e1?.subject == e2?.subject &&
        e1?.teacher == e2?.teacher;
  }

  @override
  int hash(LessonDetailsRecord? e) => const ListEquality()
      .hash([e?.videoUrl, e?.lessonNumber, e?.subject, e?.teacher]);

  @override
  bool isValidKey(Object? o) => o is LessonDetailsRecord;
}
