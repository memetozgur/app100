import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_text" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "post_teacher" field.
  String? _postTeacher;
  String get postTeacher => _postTeacher ?? '';
  bool hasPostTeacher() => _postTeacher != null;

  // "post_image" field.
  String? _postImage;
  String get postImage => _postImage ?? '';
  bool hasPostImage() => _postImage != null;

  void _initializeFields() {
    _postText = snapshotData['post_text'] as String?;
    _postTeacher = snapshotData['post_teacher'] as String?;
    _postImage = snapshotData['post_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('POSTS');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postText,
  String? postTeacher,
  String? postImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_text': postText,
      'post_teacher': postTeacher,
      'post_image': postImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    return e1?.postText == e2?.postText &&
        e1?.postTeacher == e2?.postTeacher &&
        e1?.postImage == e2?.postImage;
  }

  @override
  int hash(PostsRecord? e) =>
      const ListEquality().hash([e?.postText, e?.postTeacher, e?.postImage]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
