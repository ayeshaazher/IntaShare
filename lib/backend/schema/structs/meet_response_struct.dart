// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MeetResponseStruct extends FFFirebaseStruct {
  MeetResponseStruct({
    DocumentReference? memeber,
    String? response,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _memeber = memeber,
        _response = response,
        super(firestoreUtilData);

  // "memeber" field.
  DocumentReference? _memeber;
  DocumentReference? get memeber => _memeber;
  set memeber(DocumentReference? val) => _memeber = val;

  bool hasMemeber() => _memeber != null;

  // "response" field.
  String? _response;
  String get response => _response ?? 'null';
  set response(String? val) => _response = val;

  bool hasResponse() => _response != null;

  static MeetResponseStruct fromMap(Map<String, dynamic> data) =>
      MeetResponseStruct(
        memeber: data['memeber'] as DocumentReference?,
        response: data['response'] as String?,
      );

  static MeetResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? MeetResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'memeber': _memeber,
        'response': _response,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'memeber': serializeParam(
          _memeber,
          ParamType.DocumentReference,
        ),
        'response': serializeParam(
          _response,
          ParamType.String,
        ),
      }.withoutNulls;

  static MeetResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      MeetResponseStruct(
        memeber: deserializeParam(
          data['memeber'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        response: deserializeParam(
          data['response'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MeetResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MeetResponseStruct &&
        memeber == other.memeber &&
        response == other.response;
  }

  @override
  int get hashCode => const ListEquality().hash([memeber, response]);
}

MeetResponseStruct createMeetResponseStruct({
  DocumentReference? memeber,
  String? response,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MeetResponseStruct(
      memeber: memeber,
      response: response,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MeetResponseStruct? updateMeetResponseStruct(
  MeetResponseStruct? meetResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meetResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMeetResponseStructData(
  Map<String, dynamic> firestoreData,
  MeetResponseStruct? meetResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meetResponse == null) {
    return;
  }
  if (meetResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && meetResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final meetResponseData =
      getMeetResponseFirestoreData(meetResponse, forFieldValue);
  final nestedData =
      meetResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meetResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMeetResponseFirestoreData(
  MeetResponseStruct? meetResponse, [
  bool forFieldValue = false,
]) {
  if (meetResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meetResponse.toMap());

  // Add any Firestore field values
  mapToFirestore(meetResponse.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMeetResponseListFirestoreData(
  List<MeetResponseStruct>? meetResponses,
) =>
    meetResponses?.map((e) => getMeetResponseFirestoreData(e, true)).toList() ??
    [];
