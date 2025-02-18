import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonNotesRecord extends FirestoreRecord {
  LessonNotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lessone_note_name" field.
  String? _lessoneNoteName;
  String get lessoneNoteName => _lessoneNoteName ?? '';
  bool hasLessoneNoteName() => _lessoneNoteName != null;

  // "lesson_note_image" field.
  String? _lessonNoteImage;
  String get lessonNoteImage => _lessonNoteImage ?? '';
  bool hasLessonNoteImage() => _lessonNoteImage != null;

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
    _lessoneNoteName = snapshotData['lessone_note_name'] as String?;
    _lessonNoteImage = snapshotData['lesson_note_image'] as String?;
    _lessonNumber = snapshotData['lesson_number'] as String?;
    _subject = snapshotData['subject'] as String?;
    _teacher = snapshotData['teacher'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lesson_notes');

  static Stream<LessonNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonNotesRecord.fromSnapshot(s));

  static Future<LessonNotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonNotesRecord.fromSnapshot(s));

  static LessonNotesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonNotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonNotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonNotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonNotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonNotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonNotesRecordData({
  String? lessoneNoteName,
  String? lessonNoteImage,
  String? lessonNumber,
  String? subject,
  String? teacher,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lessone_note_name': lessoneNoteName,
      'lesson_note_image': lessonNoteImage,
      'lesson_number': lessonNumber,
      'subject': subject,
      'teacher': teacher,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonNotesRecordDocumentEquality implements Equality<LessonNotesRecord> {
  const LessonNotesRecordDocumentEquality();

  @override
  bool equals(LessonNotesRecord? e1, LessonNotesRecord? e2) {
    return e1?.lessoneNoteName == e2?.lessoneNoteName &&
        e1?.lessonNoteImage == e2?.lessonNoteImage &&
        e1?.lessonNumber == e2?.lessonNumber &&
        e1?.subject == e2?.subject &&
        e1?.teacher == e2?.teacher;
  }

  @override
  int hash(LessonNotesRecord? e) => const ListEquality().hash([
        e?.lessoneNoteName,
        e?.lessonNoteImage,
        e?.lessonNumber,
        e?.subject,
        e?.teacher
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonNotesRecord;
}
