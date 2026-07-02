import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactDetailsRecord extends FirestoreRecord {
  ContactDetailsRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _phoneNum = castToType<int>(snapshotData['phoneNum']);
    _emailAdress = snapshotData['emailAdress'] as String?;
    _homeAdress = snapshotData['homeAdress'] as String?;
    _whatsapLink = snapshotData['whatsapLink'] as String?;
    _linkedinLink = snapshotData['linkedinLink'] as String?;
    _instagramLink = snapshotData['instagramLink'] as String?;
    _facebookLink = snapshotData['facebookLink'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('contactDetails')
          : FirebaseFirestore.instance.collectionGroup('contactDetails');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('contactDetails').doc(id);

  static Stream<ContactDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactDetailsRecord.fromSnapshot(s));

  static Future<ContactDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactDetailsRecord.fromSnapshot(s));

  static ContactDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactDetailsRecordData({
  int? phoneNum,
  String? emailAdress,
  String? homeAdress,
  String? whatsapLink,
  String? linkedinLink,
  String? instagramLink,
  String? facebookLink,
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
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactDetailsRecordDocumentEquality
    implements Equality<ContactDetailsRecord> {
  const ContactDetailsRecordDocumentEquality();

  @override
  bool equals(ContactDetailsRecord? e1, ContactDetailsRecord? e2) {
    return e1?.phoneNum == e2?.phoneNum &&
        e1?.emailAdress == e2?.emailAdress &&
        e1?.homeAdress == e2?.homeAdress &&
        e1?.whatsapLink == e2?.whatsapLink &&
        e1?.linkedinLink == e2?.linkedinLink &&
        e1?.instagramLink == e2?.instagramLink &&
        e1?.facebookLink == e2?.facebookLink;
  }

  @override
  int hash(ContactDetailsRecord? e) => const ListEquality().hash([
        e?.phoneNum,
        e?.emailAdress,
        e?.homeAdress,
        e?.whatsapLink,
        e?.linkedinLink,
        e?.instagramLink,
        e?.facebookLink
      ]);

  @override
  bool isValidKey(Object? o) => o is ContactDetailsRecord;
}
