import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessRecord extends FirestoreRecord {
  BusinessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "businessLogo" field.
  String? _businessLogo;
  String get businessLogo => _businessLogo ?? '';
  bool hasBusinessLogo() => _businessLogo != null;

  // "businessCover" field.
  String? _businessCover;
  String get businessCover => _businessCover ?? '';
  bool hasBusinessCover() => _businessCover != null;

  // "businessActivities" field.
  List<String>? _businessActivities;
  List<String> get businessActivities => _businessActivities ?? const [];
  bool hasBusinessActivities() => _businessActivities != null;

  // "businessCategory" field.
  String? _businessCategory;
  String get businessCategory => _businessCategory ?? '';
  bool hasBusinessCategory() => _businessCategory != null;

  // "businessBio" field.
  String? _businessBio;
  String get businessBio => _businessBio ?? '';
  bool hasBusinessBio() => _businessBio != null;

  // "businessCity" field.
  String? _businessCity;
  String get businessCity => _businessCity ?? '';
  bool hasBusinessCity() => _businessCity != null;

  // "businessCountry" field.
  String? _businessCountry;
  String get businessCountry => _businessCountry ?? '';
  bool hasBusinessCountry() => _businessCountry != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _businessName = snapshotData['businessName'] as String?;
    _businessLogo = snapshotData['businessLogo'] as String?;
    _businessCover = snapshotData['businessCover'] as String?;
    _businessActivities = getDataList(snapshotData['businessActivities']);
    _businessCategory = snapshotData['businessCategory'] as String?;
    _businessBio = snapshotData['businessBio'] as String?;
    _businessCity = snapshotData['businessCity'] as String?;
    _businessCountry = snapshotData['businessCountry'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('business')
          : FirebaseFirestore.instance.collectionGroup('business');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('business').doc(id);

  static Stream<BusinessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessRecord.fromSnapshot(s));

  static Future<BusinessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessRecord.fromSnapshot(s));

  static BusinessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessRecordData({
  String? businessName,
  String? businessLogo,
  String? businessCover,
  String? businessCategory,
  String? businessBio,
  String? businessCity,
  String? businessCountry,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'businessName': businessName,
      'businessLogo': businessLogo,
      'businessCover': businessCover,
      'businessCategory': businessCategory,
      'businessBio': businessBio,
      'businessCity': businessCity,
      'businessCountry': businessCountry,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessRecordDocumentEquality implements Equality<BusinessRecord> {
  const BusinessRecordDocumentEquality();

  @override
  bool equals(BusinessRecord? e1, BusinessRecord? e2) {
    const listEquality = ListEquality();
    return e1?.businessName == e2?.businessName &&
        e1?.businessLogo == e2?.businessLogo &&
        e1?.businessCover == e2?.businessCover &&
        listEquality.equals(e1?.businessActivities, e2?.businessActivities) &&
        e1?.businessCategory == e2?.businessCategory &&
        e1?.businessBio == e2?.businessBio &&
        e1?.businessCity == e2?.businessCity &&
        e1?.businessCountry == e2?.businessCountry;
  }

  @override
  int hash(BusinessRecord? e) => const ListEquality().hash([
        e?.businessName,
        e?.businessLogo,
        e?.businessCover,
        e?.businessActivities,
        e?.businessCategory,
        e?.businessBio,
        e?.businessCity,
        e?.businessCountry
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessRecord;
}
