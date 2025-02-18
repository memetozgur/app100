import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReplyCommentRecord extends FirestoreRecord {
  ReplyCommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "commenttext" field.
  String? _commenttext;
  String get commenttext => _commenttext ?? '';
  bool hasCommenttext() => _commenttext != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "like" field.
  List<DocumentReference>? _like;
  List<DocumentReference> get like => _like ?? const [];
  bool hasLike() => _like != null;

  // "user_comment" field.
  String? _userComment;
  String get userComment => _userComment ?? '';
  bool hasUserComment() => _userComment != null;

  // "lesson" field.
  String? _lesson;
  String get lesson => _lesson ?? '';
  bool hasLesson() => _lesson != null;

  // "comment_id_reply" field.
  int? _commentIdReply;
  int get commentIdReply => _commentIdReply ?? 0;
  bool hasCommentIdReply() => _commentIdReply != null;

  // "teachrORnot" field.
  String? _teachrORnot;
  String get teachrORnot => _teachrORnot ?? '';
  bool hasTeachrORnot() => _teachrORnot != null;

  // "numberofreply" field.
  int? _numberofreply;
  int get numberofreply => _numberofreply ?? 0;
  bool hasNumberofreply() => _numberofreply != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _commenttext = snapshotData['commenttext'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _like = getDataList(snapshotData['like']);
    _userComment = snapshotData['user_comment'] as String?;
    _lesson = snapshotData['lesson'] as String?;
    _commentIdReply = castToType<int>(snapshotData['comment_id_reply']);
    _teachrORnot = snapshotData['teachrORnot'] as String?;
    _numberofreply = castToType<int>(snapshotData['numberofreply']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reply-comment');

  static Stream<ReplyCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReplyCommentRecord.fromSnapshot(s));

  static Future<ReplyCommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReplyCommentRecord.fromSnapshot(s));

  static ReplyCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReplyCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReplyCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReplyCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReplyCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReplyCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReplyCommentRecordData({
  String? name,
  String? image,
  String? commenttext,
  DateTime? time,
  String? userComment,
  String? lesson,
  int? commentIdReply,
  String? teachrORnot,
  int? numberofreply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'commenttext': commenttext,
      'time': time,
      'user_comment': userComment,
      'lesson': lesson,
      'comment_id_reply': commentIdReply,
      'teachrORnot': teachrORnot,
      'numberofreply': numberofreply,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReplyCommentRecordDocumentEquality
    implements Equality<ReplyCommentRecord> {
  const ReplyCommentRecordDocumentEquality();

  @override
  bool equals(ReplyCommentRecord? e1, ReplyCommentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.commenttext == e2?.commenttext &&
        e1?.time == e2?.time &&
        listEquality.equals(e1?.like, e2?.like) &&
        e1?.userComment == e2?.userComment &&
        e1?.lesson == e2?.lesson &&
        e1?.commentIdReply == e2?.commentIdReply &&
        e1?.teachrORnot == e2?.teachrORnot &&
        e1?.numberofreply == e2?.numberofreply;
  }

  @override
  int hash(ReplyCommentRecord? e) => const ListEquality().hash([
        e?.name,
        e?.image,
        e?.commenttext,
        e?.time,
        e?.like,
        e?.userComment,
        e?.lesson,
        e?.commentIdReply,
        e?.teachrORnot,
        e?.numberofreply
      ]);

  @override
  bool isValidKey(Object? o) => o is ReplyCommentRecord;
}
