// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DurationStruct extends FFFirebaseStruct {
  DurationStruct({
    int? noOf,
    String? time,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _noOf = noOf,
        _time = time,
        super(firestoreUtilData);

  // "noOf" field.
  int? _noOf;
  int get noOf => _noOf ?? 0;
  set noOf(int? val) => _noOf = val;

  void incrementNoOf(int amount) => noOf = noOf + amount;

  bool hasNoOf() => _noOf != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  static DurationStruct fromMap(Map<String, dynamic> data) => DurationStruct(
        noOf: castToType<int>(data['noOf']),
        time: data['time'] as String?,
      );

  static DurationStruct? maybeFromMap(dynamic data) =>
      data is Map ? DurationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'noOf': _noOf,
        'time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'noOf': serializeParam(
          _noOf,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
      }.withoutNulls;

  static DurationStruct fromSerializableMap(Map<String, dynamic> data) =>
      DurationStruct(
        noOf: deserializeParam(
          data['noOf'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DurationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DurationStruct && noOf == other.noOf && time == other.time;
  }

  @override
  int get hashCode => const ListEquality().hash([noOf, time]);
}

DurationStruct createDurationStruct({
  int? noOf,
  String? time,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DurationStruct(
      noOf: noOf,
      time: time,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DurationStruct? updateDurationStruct(
  DurationStruct? duration, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    duration
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDurationStructData(
  Map<String, dynamic> firestoreData,
  DurationStruct? duration,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (duration == null) {
    return;
  }
  if (duration.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && duration.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final durationData = getDurationFirestoreData(duration, forFieldValue);
  final nestedData = durationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = duration.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDurationFirestoreData(
  DurationStruct? duration, [
  bool forFieldValue = false,
]) {
  if (duration == null) {
    return {};
  }
  final firestoreData = mapToFirestore(duration.toMap());

  // Add any Firestore field values
  mapToFirestore(duration.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDurationListFirestoreData(
  List<DurationStruct>? durations,
) =>
    durations?.map((e) => getDurationFirestoreData(e, true)).toList() ?? [];
