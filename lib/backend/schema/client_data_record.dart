import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientDataRecord extends FirestoreRecord {
  ClientDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "clientEmail" field.
  String? _clientEmail;
  String get clientEmail => _clientEmail ?? '';
  bool hasClientEmail() => _clientEmail != null;

  // "clientPhone" field.
  String? _clientPhone;
  String get clientPhone => _clientPhone ?? '';
  bool hasClientPhone() => _clientPhone != null;

  // "clientResponse" field.
  String? _clientResponse;
  String get clientResponse => _clientResponse ?? '';
  bool hasClientResponse() => _clientResponse != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _clientName = snapshotData['clientName'] as String?;
    _clientEmail = snapshotData['clientEmail'] as String?;
    _clientPhone = snapshotData['clientPhone'] as String?;
    _clientResponse = snapshotData['clientResponse'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('clientData')
          : FirebaseFirestore.instance.collectionGroup('clientData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('clientData').doc(id);

  static Stream<ClientDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientDataRecord.fromSnapshot(s));

  static Future<ClientDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientDataRecord.fromSnapshot(s));

  static ClientDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientDataRecordData({
  String? clientName,
  String? clientEmail,
  String? clientPhone,
  String? clientResponse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clientName': clientName,
      'clientEmail': clientEmail,
      'clientPhone': clientPhone,
      'clientResponse': clientResponse,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientDataRecordDocumentEquality implements Equality<ClientDataRecord> {
  const ClientDataRecordDocumentEquality();

  @override
  bool equals(ClientDataRecord? e1, ClientDataRecord? e2) {
    return e1?.clientName == e2?.clientName &&
        e1?.clientEmail == e2?.clientEmail &&
        e1?.clientPhone == e2?.clientPhone &&
        e1?.clientResponse == e2?.clientResponse;
  }

  @override
  int hash(ClientDataRecord? e) => const ListEquality()
      .hash([e?.clientName, e?.clientEmail, e?.clientPhone, e?.clientResponse]);

  @override
  bool isValidKey(Object? o) => o is ClientDataRecord;
}
