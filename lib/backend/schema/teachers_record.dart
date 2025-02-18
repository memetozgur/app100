import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeachersRecord extends FirestoreRecord {
  TeachersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "teacher_name" field.
  String? _teacherName;
  String get teacherName => _teacherName ?? '';
  bool hasTeacherName() => _teacherName != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "teacher_bio" field.
  String? _teacherBio;
  String get teacherBio => _teacherBio ?? '';
  bool hasTeacherBio() => _teacherBio != null;

  // "teacher_picture" field.
  String? _teacherPicture;
  String get teacherPicture => _teacherPicture ?? '';
  bool hasTeacherPicture() => _teacherPicture != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  void _initializeFields() {
    _teacherName = snapshotData['teacher_name'] as String?;
    _subject = snapshotData['subject'] as String?;
    _teacherBio = snapshotData['teacher_bio'] as String?;
    _teacherPicture = snapshotData['teacher_picture'] as String?;
    _stage = snapshotData['stage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teachers');

  static Stream<TeachersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeachersRecord.fromSnapshot(s));

  static Future<TeachersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeachersRecord.fromSnapshot(s));

  static TeachersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeachersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeachersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeachersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeachersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeachersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeachersRecordData({
  String? teacherName,
  String? subject,
  String? teacherBio,
  String? teacherPicture,
  String? stage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacher_name': teacherName,
      'subject': subject,
      'teacher_bio': teacherBio,
      'teacher_picture': teacherPicture,
      'stage': stage,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeachersRecordDocumentEquality implements Equality<TeachersRecord> {
  const TeachersRecordDocumentEquality();

  @override
  bool equals(TeachersRecord? e1, TeachersRecord? e2) {
    return e1?.teacherName == e2?.teacherName &&
        e1?.subject == e2?.subject &&
        e1?.teacherBio == e2?.teacherBio &&
        e1?.teacherPicture == e2?.teacherPicture &&
        e1?.stage == e2?.stage;
  }

  @override
  int hash(TeachersRecord? e) => const ListEquality().hash(
      [e?.teacherName, e?.subject, e?.teacherBio, e?.teacherPicture, e?.stage]);

  @override
  bool isValidKey(Object? o) => o is TeachersRecord;
}
