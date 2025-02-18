import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userA" field.
  String? _userA;
  String get userA => _userA ?? '';
  bool hasUserA() => _userA != null;

  // "userAphoto" field.
  String? _userAphoto;
  String get userAphoto => _userAphoto ?? '';
  bool hasUserAphoto() => _userAphoto != null;

  // "userAcomment" field.
  String? _userAcomment;
  String get userAcomment => _userAcomment ?? '';
  bool hasUserAcomment() => _userAcomment != null;

  // "dateA" field.
  DateTime? _dateA;
  DateTime? get dateA => _dateA;
  bool hasDateA() => _dateA != null;

  // "dateB" field.
  DateTime? _dateB;
  DateTime? get dateB => _dateB;
  bool hasDateB() => _dateB != null;

  // "like" field.
  List<DocumentReference>? _like;
  List<DocumentReference> get like => _like ?? const [];
  bool hasLike() => _like != null;

  // "lesson_number" field.
  String? _lessonNumber;
  String get lessonNumber => _lessonNumber ?? '';
  bool hasLessonNumber() => _lessonNumber != null;

  // "comment_id" field.
  int? _commentId;
  int get commentId => _commentId ?? 0;
  bool hasCommentId() => _commentId != null;

  // "is_he_teacher" field.
  String? _isHeTeacher;
  String get isHeTeacher => _isHeTeacher ?? '';
  bool hasIsHeTeacher() => _isHeTeacher != null;

  // "replycounter" field.
  List<int>? _replycounter;
  List<int> get replycounter => _replycounter ?? const [];
  bool hasReplycounter() => _replycounter != null;

  void _initializeFields() {
    _userA = snapshotData['userA'] as String?;
    _userAphoto = snapshotData['userAphoto'] as String?;
    _userAcomment = snapshotData['userAcomment'] as String?;
    _dateA = snapshotData['dateA'] as DateTime?;
    _dateB = snapshotData['dateB'] as DateTime?;
    _like = getDataList(snapshotData['like']);
    _lessonNumber = snapshotData['lesson_number'] as String?;
    _commentId = castToType<int>(snapshotData['comment_id']);
    _isHeTeacher = snapshotData['is_he_teacher'] as String?;
    _replycounter = getDataList(snapshotData['replycounter']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  String? userA,
  String? userAphoto,
  String? userAcomment,
  DateTime? dateA,
  DateTime? dateB,
  String? lessonNumber,
  int? commentId,
  String? isHeTeacher,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userA': userA,
      'userAphoto': userAphoto,
      'userAcomment': userAcomment,
      'dateA': dateA,
      'dateB': dateB,
      'lesson_number': lessonNumber,
      'comment_id': commentId,
      'is_he_teacher': isHeTeacher,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userA == e2?.userA &&
        e1?.userAphoto == e2?.userAphoto &&
        e1?.userAcomment == e2?.userAcomment &&
        e1?.dateA == e2?.dateA &&
        e1?.dateB == e2?.dateB &&
        listEquality.equals(e1?.like, e2?.like) &&
        e1?.lessonNumber == e2?.lessonNumber &&
        e1?.commentId == e2?.commentId &&
        e1?.isHeTeacher == e2?.isHeTeacher &&
        listEquality.equals(e1?.replycounter, e2?.replycounter);
  }

  @override
  int hash(CommentRecord? e) => const ListEquality().hash([
        e?.userA,
        e?.userAphoto,
        e?.userAcomment,
        e?.dateA,
        e?.dateB,
        e?.like,
        e?.lessonNumber,
        e?.commentId,
        e?.isHeTeacher,
        e?.replycounter
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
