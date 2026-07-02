import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobtittle" field.
  String? _jobtittle;
  String get jobtittle => _jobtittle ?? '';
  bool hasJobtittle() => _jobtittle != null;

  // "implementationDetails" field.
  String? _implementationDetails;
  String get implementationDetails => _implementationDetails ?? '';
  bool hasImplementationDetails() => _implementationDetails != null;

  // "budget" field.
  double? _budget;
  double get budget => _budget ?? 0.0;
  bool hasBudget() => _budget != null;

  // "addPhotos" field.
  String? _addPhotos;
  String get addPhotos => _addPhotos ?? '';
  bool hasAddPhotos() => _addPhotos != null;

  // "photo2" field.
  String? _photo2;
  String get photo2 => _photo2 ?? '';
  bool hasPhoto2() => _photo2 != null;

  // "photo3" field.
  String? _photo3;
  String get photo3 => _photo3 ?? '';
  bool hasPhoto3() => _photo3 != null;

  // "photo4" field.
  String? _photo4;
  String get photo4 => _photo4 ?? '';
  bool hasPhoto4() => _photo4 != null;

  // "duration" field.
  DurationStruct? _duration;
  DurationStruct get duration => _duration ?? DurationStruct();
  bool hasDuration() => _duration != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jobtittle = snapshotData['jobtittle'] as String?;
    _implementationDetails = snapshotData['implementationDetails'] as String?;
    _budget = castToType<double>(snapshotData['budget']);
    _addPhotos = snapshotData['addPhotos'] as String?;
    _photo2 = snapshotData['photo2'] as String?;
    _photo3 = snapshotData['photo3'] as String?;
    _photo4 = snapshotData['photo4'] as String?;
    _duration = snapshotData['duration'] is DurationStruct
        ? snapshotData['duration']
        : DurationStruct.maybeFromMap(snapshotData['duration']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('projects')
          : FirebaseFirestore.instance.collectionGroup('projects');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('projects').doc(id);

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  String? jobtittle,
  String? implementationDetails,
  double? budget,
  String? addPhotos,
  String? photo2,
  String? photo3,
  String? photo4,
  DurationStruct? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobtittle': jobtittle,
      'implementationDetails': implementationDetails,
      'budget': budget,
      'addPhotos': addPhotos,
      'photo2': photo2,
      'photo3': photo3,
      'photo4': photo4,
      'duration': DurationStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "duration" field.
  addDurationStructData(firestoreData, duration, 'duration');

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    return e1?.jobtittle == e2?.jobtittle &&
        e1?.implementationDetails == e2?.implementationDetails &&
        e1?.budget == e2?.budget &&
        e1?.addPhotos == e2?.addPhotos &&
        e1?.photo2 == e2?.photo2 &&
        e1?.photo3 == e2?.photo3 &&
        e1?.photo4 == e2?.photo4 &&
        e1?.duration == e2?.duration;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.jobtittle,
        e?.implementationDetails,
        e?.budget,
        e?.addPhotos,
        e?.photo2,
        e?.photo3,
        e?.photo4,
        e?.duration
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
