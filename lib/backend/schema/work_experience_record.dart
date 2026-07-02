import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkExperienceRecord extends FirestoreRecord {
  WorkExperienceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobTittle" field.
  String? _jobTittle;
  String get jobTittle => _jobTittle ?? '';
  bool hasJobTittle() => _jobTittle != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "contractDuration" field.
  String? _contractDuration;
  String get contractDuration => _contractDuration ?? '';
  bool hasContractDuration() => _contractDuration != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "otherDetails" field.
  String? _otherDetails;
  String get otherDetails => _otherDetails ?? '';
  bool hasOtherDetails() => _otherDetails != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jobTittle = snapshotData['jobTittle'] as String?;
    _department = snapshotData['department'] as String?;
    _contractDuration = snapshotData['contractDuration'] as String?;
    _company = snapshotData['company'] as String?;
    _otherDetails = snapshotData['otherDetails'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('workExperience')
          : FirebaseFirestore.instance.collectionGroup('workExperience');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('workExperience').doc(id);

  static Stream<WorkExperienceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkExperienceRecord.fromSnapshot(s));

  static Future<WorkExperienceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkExperienceRecord.fromSnapshot(s));

  static WorkExperienceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkExperienceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkExperienceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkExperienceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkExperienceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkExperienceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkExperienceRecordData({
  String? jobTittle,
  String? department,
  String? contractDuration,
  String? company,
  String? otherDetails,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobTittle': jobTittle,
      'department': department,
      'contractDuration': contractDuration,
      'company': company,
      'otherDetails': otherDetails,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkExperienceRecordDocumentEquality
    implements Equality<WorkExperienceRecord> {
  const WorkExperienceRecordDocumentEquality();

  @override
  bool equals(WorkExperienceRecord? e1, WorkExperienceRecord? e2) {
    return e1?.jobTittle == e2?.jobTittle &&
        e1?.department == e2?.department &&
        e1?.contractDuration == e2?.contractDuration &&
        e1?.company == e2?.company &&
        e1?.otherDetails == e2?.otherDetails;
  }

  @override
  int hash(WorkExperienceRecord? e) => const ListEquality().hash([
        e?.jobTittle,
        e?.department,
        e?.contractDuration,
        e?.company,
        e?.otherDetails
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkExperienceRecord;
}
