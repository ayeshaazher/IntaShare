import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessContactDetailsRecord extends FirestoreRecord {
  BusinessContactDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "phoneNum" field.
  int? _phoneNum;
  int get phoneNum => _phoneNum ?? 0;
  bool hasPhoneNum() => _phoneNum != null;

  // "emailAdress" field.
  String? _emailAdress;
  String get emailAdress => _emailAdress ?? '';
  bool hasEmailAdress() => _emailAdress != null;

  // "homeAdress" field.
  String? _homeAdress;
  String get homeAdress => _homeAdress ?? '';
  bool hasHomeAdress() => _homeAdress != null;

  // "whatsapLink" field.
  String? _whatsapLink;
  String get whatsapLink => _whatsapLink ?? '';
  bool hasWhatsapLink() => _whatsapLink != null;

  // "linkedinLink" field.
  String? _linkedinLink;
  String get linkedinLink => _linkedinLink ?? '';
  bool hasLinkedinLink() => _linkedinLink != null;

  // "instagramLink" field.
  String? _instagramLink;
  String get instagramLink => _instagramLink ?? '';
  bool hasInstagramLink() => _instagramLink != null;

  // "facebookLink" field.
  String? _facebookLink;
  String get facebookLink => _facebookLink ?? '';
  bool hasFacebookLink() => _facebookLink != null;

  // "businessRef" field.
  DocumentReference? _businessRef;
  DocumentReference? get businessRef => _businessRef;
  bool hasBusinessRef() => _businessRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _phoneNum = castToType<int>(snapshotData['phoneNum']);
    _emailAdress = snapshotData['emailAdress'] as String?;
    _homeAdress = snapshotData['homeAdress'] as String?;
    _whatsapLink = snapshotData['whatsapLink'] as String?;
    _linkedinLink = snapshotData['linkedinLink'] as String?;
    _instagramLink = snapshotData['instagramLink'] as String?;
    _facebookLink = snapshotData['facebookLink'] as String?;
    _businessRef = snapshotData['businessRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('businessContactDetails')
          : FirebaseFirestore.instance
              .collectionGroup('businessContactDetails');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('businessContactDetails').doc(id);

  static Stream<BusinessContactDetailsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessContactDetailsRecord.fromSnapshot(s));

  static Future<BusinessContactDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BusinessContactDetailsRecord.fromSnapshot(s));

  static BusinessContactDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessContactDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessContactDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessContactDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessContactDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessContactDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessContactDetailsRecordData({
  int? phoneNum,
  String? emailAdress,
  String? homeAdress,
  String? whatsapLink,
  String? linkedinLink,
  String? instagramLink,
  String? facebookLink,
  DocumentReference? businessRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'phoneNum': phoneNum,
      'emailAdress': emailAdress,
      'homeAdress': homeAdress,
      'whatsapLink': whatsapLink,
      'linkedinLink': linkedinLink,
      'instagramLink': instagramLink,
      'facebookLink': facebookLink,
      'businessRef': businessRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessContactDetailsRecordDocumentEquality
    implements Equality<BusinessContactDetailsRecord> {
  const BusinessContactDetailsRecordDocumentEquality();

  @override
  bool equals(
      BusinessContactDetailsRecord? e1, BusinessContactDetailsRecord? e2) {
    return e1?.phoneNum == e2?.phoneNum &&
        e1?.emailAdress == e2?.emailAdress &&
        e1?.homeAdress == e2?.homeAdress &&
        e1?.whatsapLink == e2?.whatsapLink &&
        e1?.linkedinLink == e2?.linkedinLink &&
        e1?.instagramLink == e2?.instagramLink &&
        e1?.facebookLink == e2?.facebookLink &&
        e1?.businessRef == e2?.businessRef;
  }

  @override
  int hash(BusinessContactDetailsRecord? e) => const ListEquality().hash([
        e?.phoneNum,
        e?.emailAdress,
        e?.homeAdress,
        e?.whatsapLink,
        e?.linkedinLink,
        e?.instagramLink,
        e?.facebookLink,
        e?.businessRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessContactDetailsRecord;
}
