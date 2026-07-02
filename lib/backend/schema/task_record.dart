import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskRecord extends FirestoreRecord {
  TaskRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taskId" field.
  String? _taskId;
  String get taskId => _taskId ?? '';
  bool hasTaskId() => _taskId != null;

  // "taskDetails" field.
  String? _taskDetails;
  String get taskDetails => _taskDetails ?? '';
  bool hasTaskDetails() => _taskDetails != null;

  // "taskDate" field.
  DateTime? _taskDate;
  DateTime? get taskDate => _taskDate;
  bool hasTaskDate() => _taskDate != null;

  // "taskTime" field.
  DateTime? _taskTime;
  DateTime? get taskTime => _taskTime;
  bool hasTaskTime() => _taskTime != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _taskId = snapshotData['taskId'] as String?;
    _taskDetails = snapshotData['taskDetails'] as String?;
    _taskDate = snapshotData['taskDate'] as DateTime?;
    _taskTime = snapshotData['taskTime'] as DateTime?;
    _userId = snapshotData['userId'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('task');

  static Stream<TaskRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaskRecord.fromSnapshot(s));

  static Future<TaskRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaskRecord.fromSnapshot(s));

  static TaskRecord fromSnapshot(DocumentSnapshot snapshot) => TaskRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaskRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaskRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaskRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaskRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaskRecordData({
  String? taskId,
  String? taskDetails,
  DateTime? taskDate,
  DateTime? taskTime,
  String? userId,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskId': taskId,
      'taskDetails': taskDetails,
      'taskDate': taskDate,
      'taskTime': taskTime,
      'userId': userId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaskRecordDocumentEquality implements Equality<TaskRecord> {
  const TaskRecordDocumentEquality();

  @override
  bool equals(TaskRecord? e1, TaskRecord? e2) {
    return e1?.taskId == e2?.taskId &&
        e1?.taskDetails == e2?.taskDetails &&
        e1?.taskDate == e2?.taskDate &&
        e1?.taskTime == e2?.taskTime &&
        e1?.userId == e2?.userId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(TaskRecord? e) => const ListEquality().hash([
        e?.taskId,
        e?.taskDetails,
        e?.taskDate,
        e?.taskTime,
        e?.userId,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is TaskRecord;
}
