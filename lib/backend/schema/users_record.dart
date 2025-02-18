import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "parent_phone" field.
  int? _parentPhone;
  int get parentPhone => _parentPhone ?? 0;
  bool hasParentPhone() => _parentPhone != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "student_phone" field.
  int? _studentPhone;
  int get studentPhone => _studentPhone ?? 0;
  bool hasStudentPhone() => _studentPhone != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "c11" field.
  List<String>? _c11;
  List<String> get c11 => _c11 ?? const [];
  bool hasC11() => _c11 != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  // "wall_photo" field.
  String? _wallPhoto;
  String get wallPhoto => _wallPhoto ?? '';
  bool hasWallPhoto() => _wallPhoto != null;

  // "serial" field.
  int? _serial;
  int get serial => _serial ?? 0;
  bool hasSerial() => _serial != null;

  // "user_device_serial" field.
  int? _userDeviceSerial;
  int get userDeviceSerial => _userDeviceSerial ?? 0;
  bool hasUserDeviceSerial() => _userDeviceSerial != null;

  // "is_he_teacher" field.
  String? _isHeTeacher;
  String get isHeTeacher => _isHeTeacher ?? '';
  bool hasIsHeTeacher() => _isHeTeacher != null;

  // "myorders" field.
  List<DocumentReference>? _myorders;
  List<DocumentReference> get myorders => _myorders ?? const [];
  bool hasMyorders() => _myorders != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _parentPhone = castToType<int>(snapshotData['parent_phone']);
    _city = snapshotData['city'] as String?;
    _address = snapshotData['address'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _studentPhone = castToType<int>(snapshotData['student_phone']);
    _stage = snapshotData['stage'] as String?;
    _c11 = getDataList(snapshotData['c11']);
    _balance = castToType<double>(snapshotData['balance']);
    _wallPhoto = snapshotData['wall_photo'] as String?;
    _serial = castToType<int>(snapshotData['serial']);
    _userDeviceSerial = castToType<int>(snapshotData['user_device_serial']);
    _isHeTeacher = snapshotData['is_he_teacher'] as String?;
    _myorders = getDataList(snapshotData['myorders']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  int? parentPhone,
  String? city,
  String? address,
  String? phoneNumber,
  int? studentPhone,
  String? stage,
  double? balance,
  String? wallPhoto,
  int? serial,
  int? userDeviceSerial,
  String? isHeTeacher,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'parent_phone': parentPhone,
      'city': city,
      'address': address,
      'phone_number': phoneNumber,
      'student_phone': studentPhone,
      'stage': stage,
      'balance': balance,
      'wall_photo': wallPhoto,
      'serial': serial,
      'user_device_serial': userDeviceSerial,
      'is_he_teacher': isHeTeacher,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.parentPhone == e2?.parentPhone &&
        e1?.city == e2?.city &&
        e1?.address == e2?.address &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.studentPhone == e2?.studentPhone &&
        e1?.stage == e2?.stage &&
        listEquality.equals(e1?.c11, e2?.c11) &&
        e1?.balance == e2?.balance &&
        e1?.wallPhoto == e2?.wallPhoto &&
        e1?.serial == e2?.serial &&
        e1?.userDeviceSerial == e2?.userDeviceSerial &&
        e1?.isHeTeacher == e2?.isHeTeacher &&
        listEquality.equals(e1?.myorders, e2?.myorders);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.parentPhone,
        e?.city,
        e?.address,
        e?.phoneNumber,
        e?.studentPhone,
        e?.stage,
        e?.c11,
        e?.balance,
        e?.wallPhoto,
        e?.serial,
        e?.userDeviceSerial,
        e?.isHeTeacher,
        e?.myorders
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
