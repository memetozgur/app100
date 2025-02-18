import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LesFileRecord extends FirestoreRecord {
  LesFileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lesson_number" field.
  String? _lessonNumber;
  String get lessonNumber => _lessonNumber ?? '';
  bool hasLessonNumber() => _lessonNumber != null;

  // "name_file" field.
  String? _nameFile;
  String get nameFile => _nameFile ?? '';
  bool hasNameFile() => _nameFile != null;

  // "pdf_url" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "teacher_of_subject" field.
  String? _teacherOfSubject;
  String get teacherOfSubject => _teacherOfSubject ?? '';
  bool hasTeacherOfSubject() => _teacherOfSubject != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "post_time" field.
  DateTime? _postTime;
  DateTime? get postTime => _postTime;
  bool hasPostTime() => _postTime != null;

  void _initializeFields() {
    _lessonNumber = snapshotData['lesson_number'] as String?;
    _nameFile = snapshotData['name_file'] as String?;
    _pdfUrl = snapshotData['pdf_url'] as String?;
    _teacherOfSubject = snapshotData['teacher_of_subject'] as String?;
    _subject = snapshotData['subject'] as String?;
    _postTime = snapshotData['post_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('les_file');

  static Stream<LesFileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LesFileRecord.fromSnapshot(s));

  static Future<LesFileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LesFileRecord.fromSnapshot(s));

  static LesFileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LesFileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LesFileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LesFileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LesFileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LesFileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLesFileRecordData({
  String? lessonNumber,
  String? nameFile,
  String? pdfUrl,
  String? teacherOfSubject,
  String? subject,
  DateTime? postTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lesson_number': lessonNumber,
      'name_file': nameFile,
      'pdf_url': pdfUrl,
      'teacher_of_subject': teacherOfSubject,
      'subject': subject,
      'post_time': postTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class LesFileRecordDocumentEquality implements Equality<LesFileRecord> {
  const LesFileRecordDocumentEquality();

  @override
  bool equals(LesFileRecord? e1, LesFileRecord? e2) {
    return e1?.lessonNumber == e2?.lessonNumber &&
        e1?.nameFile == e2?.nameFile &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.teacherOfSubject == e2?.teacherOfSubject &&
        e1?.subject == e2?.subject &&
        e1?.postTime == e2?.postTime;
  }

  @override
  int hash(LesFileRecord? e) => const ListEquality().hash([
        e?.lessonNumber,
        e?.nameFile,
        e?.pdfUrl,
        e?.teacherOfSubject,
        e?.subject,
        e?.postTime
      ]);

  @override
  bool isValidKey(Object? o) => o is LesFileRecord;
}
