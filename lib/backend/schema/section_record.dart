import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectionRecord extends FirestoreRecord {
  SectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "section_name" field.
  String? _sectionName;
  String get sectionName => _sectionName ?? '';
  bool hasSectionName() => _sectionName != null;

  // "teacher" field.
  String? _teacher;
  String get teacher => _teacher ?? '';
  bool hasTeacher() => _teacher != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  void _initializeFields() {
    _sectionName = snapshotData['section_name'] as String?;
    _teacher = snapshotData['teacher'] as String?;
    _subject = snapshotData['subject'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('section');

  static Stream<SectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SectionRecord.fromSnapshot(s));

  static Future<SectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SectionRecord.fromSnapshot(s));

  static SectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSectionRecordData({
  String? sectionName,
  String? teacher,
  String? subject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'section_name': sectionName,
      'teacher': teacher,
      'subject': subject,
    }.withoutNulls,
  );

  return firestoreData;
}

class SectionRecordDocumentEquality implements Equality<SectionRecord> {
  const SectionRecordDocumentEquality();

  @override
  bool equals(SectionRecord? e1, SectionRecord? e2) {
    return e1?.sectionName == e2?.sectionName &&
        e1?.teacher == e2?.teacher &&
        e1?.subject == e2?.subject;
  }

  @override
  int hash(SectionRecord? e) =>
      const ListEquality().hash([e?.sectionName, e?.teacher, e?.subject]);

  @override
  bool isValidKey(Object? o) => o is SectionRecord;
}
