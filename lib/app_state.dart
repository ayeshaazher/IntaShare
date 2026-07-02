import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _nevOpen = prefs.getBool('ff_nevOpen') ?? _nevOpen;
    });
    _safeInit(() {
      _searchHistory = prefs
              .getStringList('ff_searchHistory')
              ?.map((path) => path.ref)
              .toList() ??
          _searchHistory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _nevOpen = false;
  bool get nevOpen => _nevOpen;
  set nevOpen(bool value) {
    _nevOpen = value;
    prefs.setBool('ff_nevOpen', value);
  }

  List<DocumentReference> _searchHistory = [];
  List<DocumentReference> get searchHistory => _searchHistory;
  set searchHistory(List<DocumentReference> value) {
    _searchHistory = value;
    prefs.setStringList('ff_searchHistory', value.map((x) => x.path).toList());
  }

  void addToSearchHistory(DocumentReference value) {
    searchHistory.add(value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void removeFromSearchHistory(DocumentReference value) {
    searchHistory.remove(value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void removeAtIndexFromSearchHistory(int index) {
    searchHistory.removeAt(index);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void updateSearchHistoryAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    searchHistory[index] = updateFn(_searchHistory[index]);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  void insertAtIndexInSearchHistory(int index, DocumentReference value) {
    searchHistory.insert(index, value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.path).toList());
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);

  final _taskManager = StreamRequestManager<List<TaskRecord>>();
  Stream<List<TaskRecord>> task({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TaskRecord>> Function() requestFn,
  }) =>
      _taskManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTaskCache() => _taskManager.clear();
  void clearTaskCacheKey(String? uniqueKey) =>
      _taskManager.clearRequest(uniqueKey);

  final _teamNotificationManager = StreamRequestManager<List<TeamRecord>>();
  Stream<List<TeamRecord>> teamNotification({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TeamRecord>> Function() requestFn,
  }) =>
      _teamNotificationManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTeamNotificationCache() => _teamNotificationManager.clear();
  void clearTeamNotificationCacheKey(String? uniqueKey) =>
      _teamNotificationManager.clearRequest(uniqueKey);

  final _otherUserManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> otherUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _otherUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOtherUserCache() => _otherUserManager.clear();
  void clearOtherUserCacheKey(String? uniqueKey) =>
      _otherUserManager.clearRequest(uniqueKey);

  final _connectUserManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> connectUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _connectUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearConnectUserCache() => _connectUserManager.clear();
  void clearConnectUserCacheKey(String? uniqueKey) =>
      _connectUserManager.clearRequest(uniqueKey);

  final _profileManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> profile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _profileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileCache() => _profileManager.clear();
  void clearProfileCacheKey(String? uniqueKey) =>
      _profileManager.clearRequest(uniqueKey);

  final _adminUserVerifyManager = FutureRequestManager<int>();
  Future<int> adminUserVerify({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _adminUserVerifyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAdminUserVerifyCache() => _adminUserVerifyManager.clear();
  void clearAdminUserVerifyCacheKey(String? uniqueKey) =>
      _adminUserVerifyManager.clearRequest(uniqueKey);

  final _adminTeamManager = FutureRequestManager<int>();
  Future<int> adminTeam({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _adminTeamManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAdminTeamCache() => _adminTeamManager.clear();
  void clearAdminTeamCacheKey(String? uniqueKey) =>
      _adminTeamManager.clearRequest(uniqueKey);

  final _adminPremManager = FutureRequestManager<int>();
  Future<int> adminPrem({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _adminPremManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAdminPremCache() => _adminPremManager.clear();
  void clearAdminPremCacheKey(String? uniqueKey) =>
      _adminPremManager.clearRequest(uniqueKey);

  final _adminAllManager = FutureRequestManager<int>();
  Future<int> adminAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _adminAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAdminAllCache() => _adminAllManager.clear();
  void clearAdminAllCacheKey(String? uniqueKey) =>
      _adminAllManager.clearRequest(uniqueKey);

  final _chatListManager = StreamRequestManager<List<ChatsRecord>>();
  Stream<List<ChatsRecord>> chatList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatsRecord>> Function() requestFn,
  }) =>
      _chatListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatListCache() => _chatListManager.clear();
  void clearChatListCacheKey(String? uniqueKey) =>
      _chatListManager.clearRequest(uniqueKey);

  final _fullTaskManager = StreamRequestManager<List<TaskRecord>>();
  Stream<List<TaskRecord>> fullTask({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TaskRecord>> Function() requestFn,
  }) =>
      _fullTaskManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFullTaskCache() => _fullTaskManager.clear();
  void clearFullTaskCacheKey(String? uniqueKey) =>
      _fullTaskManager.clearRequest(uniqueKey);

  final _teamsManager = StreamRequestManager<List<TeamRecord>>();
  Stream<List<TeamRecord>> teams({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TeamRecord>> Function() requestFn,
  }) =>
      _teamsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTeamsCache() => _teamsManager.clear();
  void clearTeamsCacheKey(String? uniqueKey) =>
      _teamsManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
