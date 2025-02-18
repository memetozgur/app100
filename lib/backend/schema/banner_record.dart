import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannerRecord extends FirestoreRecord {
  BannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "banner_image1" field.
  String? _bannerImage1;
  String get bannerImage1 => _bannerImage1 ?? '';
  bool hasBannerImage1() => _bannerImage1 != null;

  // "banner_image2" field.
  String? _bannerImage2;
  String get bannerImage2 => _bannerImage2 ?? '';
  bool hasBannerImage2() => _bannerImage2 != null;

  // "banner_image3" field.
  String? _bannerImage3;
  String get bannerImage3 => _bannerImage3 ?? '';
  bool hasBannerImage3() => _bannerImage3 != null;

  void _initializeFields() {
    _bannerImage1 = snapshotData['banner_image1'] as String?;
    _bannerImage2 = snapshotData['banner_image2'] as String?;
    _bannerImage3 = snapshotData['banner_image3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banner');

  static Stream<BannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannerRecord.fromSnapshot(s));

  static Future<BannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannerRecord.fromSnapshot(s));

  static BannerRecord fromSnapshot(DocumentSnapshot snapshot) => BannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannerRecordData({
  String? bannerImage1,
  String? bannerImage2,
  String? bannerImage3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'banner_image1': bannerImage1,
      'banner_image2': bannerImage2,
      'banner_image3': bannerImage3,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannerRecordDocumentEquality implements Equality<BannerRecord> {
  const BannerRecordDocumentEquality();

  @override
  bool equals(BannerRecord? e1, BannerRecord? e2) {
    return e1?.bannerImage1 == e2?.bannerImage1 &&
        e1?.bannerImage2 == e2?.bannerImage2 &&
        e1?.bannerImage3 == e2?.bannerImage3;
  }

  @override
  int hash(BannerRecord? e) => const ListEquality()
      .hash([e?.bannerImage1, e?.bannerImage2, e?.bannerImage3]);

  @override
  bool isValidKey(Object? o) => o is BannerRecord;
}
