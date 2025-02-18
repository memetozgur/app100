import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "course_image" field.
  String? _courseImage;
  String get courseImage => _courseImage ?? '';
  bool hasCourseImage() => _courseImage != null;

  // "course_describtion" field.
  String? _courseDescribtion;
  String get courseDescribtion => _courseDescribtion ?? '';
  bool hasCourseDescribtion() => _courseDescribtion != null;

  // "course_teacher" field.
  String? _courseTeacher;
  String get courseTeacher => _courseTeacher ?? '';
  bool hasCourseTeacher() => _courseTeacher != null;

  // "course_price" field.
  double? _coursePrice;
  double get coursePrice => _coursePrice ?? 0.0;
  bool hasCoursePrice() => _coursePrice != null;

  // "is_favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "course_code" field.
  int? _courseCode;
  int get courseCode => _courseCode ?? 0;
  bool hasCourseCode() => _courseCode != null;

  // "date_created" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  void _initializeFields() {
    _courseImage = snapshotData['course_image'] as String?;
    _courseDescribtion = snapshotData['course_describtion'] as String?;
    _courseTeacher = snapshotData['course_teacher'] as String?;
    _coursePrice = castToType<double>(snapshotData['course_price']);
    _isFavorite = snapshotData['is_favorite'] as bool?;
    _stage = snapshotData['stage'] as String?;
    _subject = snapshotData['subject'] as String?;
    _courseCode = castToType<int>(snapshotData['course_code']);
    _dateCreated = snapshotData['date_created'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? courseImage,
  String? courseDescribtion,
  String? courseTeacher,
  double? coursePrice,
  bool? isFavorite,
  String? stage,
  String? subject,
  int? courseCode,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_image': courseImage,
      'course_describtion': courseDescribtion,
      'course_teacher': courseTeacher,
      'course_price': coursePrice,
      'is_favorite': isFavorite,
      'stage': stage,
      'subject': subject,
      'course_code': courseCode,
      'date_created': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    return e1?.courseImage == e2?.courseImage &&
        e1?.courseDescribtion == e2?.courseDescribtion &&
        e1?.courseTeacher == e2?.courseTeacher &&
        e1?.coursePrice == e2?.coursePrice &&
        e1?.isFavorite == e2?.isFavorite &&
        e1?.stage == e2?.stage &&
        e1?.subject == e2?.subject &&
        e1?.courseCode == e2?.courseCode &&
        e1?.dateCreated == e2?.dateCreated;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.courseImage,
        e?.courseDescribtion,
        e?.courseTeacher,
        e?.coursePrice,
        e?.isFavorite,
        e?.stage,
        e?.subject,
        e?.courseCode,
        e?.dateCreated
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
