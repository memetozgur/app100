import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SerialCodesRecord extends FirestoreRecord {
  SerialCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "serials" field.
  List<String>? _serials;
  List<String> get serials => _serials ?? const [];
  bool hasSerials() => _serials != null;

  void _initializeFields() {
    _serials = getDataList(snapshotData['serials']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('serial_codes');

  static Stream<SerialCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SerialCodesRecord.fromSnapshot(s));

  static Future<SerialCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SerialCodesRecord.fromSnapshot(s));

  static SerialCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SerialCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SerialCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SerialCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SerialCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SerialCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSerialCodesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SerialCodesRecordDocumentEquality implements Equality<SerialCodesRecord> {
  const SerialCodesRecordDocumentEquality();

  @override
  bool equals(SerialCodesRecord? e1, SerialCodesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.serials, e2?.serials);
  }

  @override
  int hash(SerialCodesRecord? e) => const ListEquality().hash([e?.serials]);

  @override
  bool isValidKey(Object? o) => o is SerialCodesRecord;
}
