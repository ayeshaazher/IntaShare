import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeetingRecord extends FirestoreRecord {
  MeetingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "responses" field.
  List<MeetResponseStruct>? _responses;
  List<MeetResponseStruct> get responses => _responses ?? const [];
  bool hasResponses() => _responses != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _time = snapshotData['time'] as DateTime?;
    _link = snapshotData['link'] as String?;
    _responses = getStructList(
      snapshotData['responses'],
      MeetResponseStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('meeting')
          : FirebaseFirestore.instance.collectionGroup('meeting');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('meeting').doc(id);

  static Stream<MeetingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeetingRecord.fromSnapshot(s));

  static Future<MeetingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeetingRecord.fromSnapshot(s));

  static MeetingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeetingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeetingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeetingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeetingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeetingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeetingRecordData({
  String? message,
  DateTime? date,
  DateTime? time,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'date': date,
      'time': time,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeetingRecordDocumentEquality implements Equality<MeetingRecord> {
  const MeetingRecordDocumentEquality();

  @override
  bool equals(MeetingRecord? e1, MeetingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.message == e2?.message &&
        e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.link == e2?.link &&
        listEquality.equals(e1?.responses, e2?.responses);
  }

  @override
  int hash(MeetingRecord? e) => const ListEquality()
      .hash([e?.message, e?.date, e?.time, e?.link, e?.responses]);

  @override
  bool isValidKey(Object? o) => o is MeetingRecord;
}
