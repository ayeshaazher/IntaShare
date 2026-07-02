import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamRecord extends FirestoreRecord {
  TeamRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "teamId" field.
  String? _teamId;
  String get teamId => _teamId ?? '';
  bool hasTeamId() => _teamId != null;

  // "teamAdmin" field.
  DocumentReference? _teamAdmin;
  DocumentReference? get teamAdmin => _teamAdmin;
  bool hasTeamAdmin() => _teamAdmin != null;

  // "teamMembers" field.
  List<DocumentReference>? _teamMembers;
  List<DocumentReference> get teamMembers => _teamMembers ?? const [];
  bool hasTeamMembers() => _teamMembers != null;

  // "teamName" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "hasRead" field.
  bool? _hasRead;
  bool get hasRead => _hasRead ?? false;
  bool hasHasRead() => _hasRead != null;

  void _initializeFields() {
    _teamId = snapshotData['teamId'] as String?;
    _teamAdmin = snapshotData['teamAdmin'] as DocumentReference?;
    _teamMembers = getDataList(snapshotData['teamMembers']);
    _teamName = snapshotData['teamName'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
    _hasRead = snapshotData['hasRead'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('team');

  static Stream<TeamRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamRecord.fromSnapshot(s));

  static Future<TeamRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamRecord.fromSnapshot(s));

  static TeamRecord fromSnapshot(DocumentSnapshot snapshot) => TeamRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamRecordData({
  String? teamId,
  DocumentReference? teamAdmin,
  String? teamName,
  DateTime? createdTime,
  DocumentReference? chatRef,
  bool? hasRead,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teamId': teamId,
      'teamAdmin': teamAdmin,
      'teamName': teamName,
      'createdTime': createdTime,
      'chatRef': chatRef,
      'hasRead': hasRead,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamRecordDocumentEquality implements Equality<TeamRecord> {
  const TeamRecordDocumentEquality();

  @override
  bool equals(TeamRecord? e1, TeamRecord? e2) {
    const listEquality = ListEquality();
    return e1?.teamId == e2?.teamId &&
        e1?.teamAdmin == e2?.teamAdmin &&
        listEquality.equals(e1?.teamMembers, e2?.teamMembers) &&
        e1?.teamName == e2?.teamName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.chatRef == e2?.chatRef &&
        e1?.hasRead == e2?.hasRead;
  }

  @override
  int hash(TeamRecord? e) => const ListEquality().hash([
        e?.teamId,
        e?.teamAdmin,
        e?.teamMembers,
        e?.teamName,
        e?.createdTime,
        e?.chatRef,
        e?.hasRead
      ]);

  @override
  bool isValidKey(Object? o) => o is TeamRecord;
}
