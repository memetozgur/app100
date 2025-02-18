import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StagesRecord extends FirestoreRecord {
  StagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "stage_image" field.
  String? _stageImage;
  String get stageImage => _stageImage ?? '';
  bool hasStageImage() => _stageImage != null;

  void _initializeFields() {
    _stage = snapshotData['stage'] as String?;
    _stageImage = snapshotData['stage_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stages');

  static Stream<StagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StagesRecord.fromSnapshot(s));

  static Future<StagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StagesRecord.fromSnapshot(s));

  static StagesRecord fromSnapshot(DocumentSnapshot snapshot) => StagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStagesRecordData({
  String? stage,
  String? stageImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stage': stage,
      'stage_image': stageImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class StagesRecordDocumentEquality implements Equality<StagesRecord> {
  const StagesRecordDocumentEquality();

  @override
  bool equals(StagesRecord? e1, StagesRecord? e2) {
    return e1?.stage == e2?.stage && e1?.stageImage == e2?.stageImage;
  }

  @override
  int hash(StagesRecord? e) =>
      const ListEquality().hash([e?.stage, e?.stageImage]);

  @override
  bool isValidKey(Object? o) => o is StagesRecord;
}
