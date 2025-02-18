import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonRecord extends FirestoreRecord {
  LessonRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "section" field.
  String? _section;
  String get section => _section ?? '';
  bool hasSection() => _section != null;

  // "lesson_number" field.
  String? _lessonNumber;
  String get lessonNumber => _lessonNumber ?? '';
  bool hasLessonNumber() => _lessonNumber != null;

  // "teacher" field.
  String? _teacher;
  String get teacher => _teacher ?? '';
  bool hasTeacher() => _teacher != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _section = snapshotData['section'] as String?;
    _lessonNumber = snapshotData['lesson_number'] as String?;
    _teacher = snapshotData['teacher'] as String?;
    _subject = snapshotData['subject'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lesson')
          : FirebaseFirestore.instance.collectionGroup('lesson');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lesson').doc(id);

  static Stream<LessonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonRecord.fromSnapshot(s));

  static Future<LessonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonRecord.fromSnapshot(s));

  static LessonRecord fromSnapshot(DocumentSnapshot snapshot) => LessonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonRecordData({
  String? section,
  String? lessonNumber,
  String? teacher,
  String? subject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'section': section,
      'lesson_number': lessonNumber,
      'teacher': teacher,
      'subject': subject,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonRecordDocumentEquality implements Equality<LessonRecord> {
  const LessonRecordDocumentEquality();

  @override
  bool equals(LessonRecord? e1, LessonRecord? e2) {
    return e1?.section == e2?.section &&
        e1?.lessonNumber == e2?.lessonNumber &&
        e1?.teacher == e2?.teacher &&
        e1?.subject == e2?.subject;
  }

  @override
  int hash(LessonRecord? e) => const ListEquality()
      .hash([e?.section, e?.lessonNumber, e?.teacher, e?.subject]);

  @override
  bool isValidKey(Object? o) => o is LessonRecord;
}
