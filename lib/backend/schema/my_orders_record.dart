import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyOrdersRecord extends FirestoreRecord {
  MyOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "course_code" field.
  int? _courseCode;
  int get courseCode => _courseCode ?? 0;
  bool hasCourseCode() => _courseCode != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _courseCode = castToType<int>(snapshotData['course_code']);
    _userId = snapshotData['user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('my_orders');

  static Stream<MyOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyOrdersRecord.fromSnapshot(s));

  static Future<MyOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyOrdersRecord.fromSnapshot(s));

  static MyOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MyOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyOrdersRecordData({
  int? courseCode,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_code': courseCode,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyOrdersRecordDocumentEquality implements Equality<MyOrdersRecord> {
  const MyOrdersRecordDocumentEquality();

  @override
  bool equals(MyOrdersRecord? e1, MyOrdersRecord? e2) {
    return e1?.courseCode == e2?.courseCode && e1?.userId == e2?.userId;
  }

  @override
  int hash(MyOrdersRecord? e) =>
      const ListEquality().hash([e?.courseCode, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is MyOrdersRecord;
}
