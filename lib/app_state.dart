import 'package:flutter/material.dart';
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
      _favourite = prefs
              .getStringList('ff_favourite')
              ?.map((path) => path.ref)
              .toList() ??
          _favourite;
    });
    _safeInit(() {
      _coursecode =
          prefs.getStringList('ff_coursecode')?.map(int.parse).toList() ??
              _coursecode;
    });
    _safeInit(() {
      _stage = prefs.getString('ff_stage') ?? _stage;
    });
    _safeInit(() {
      _deviceid = prefs.getInt('ff_deviceid') ?? _deviceid;
    });
    _safeInit(() {
      _compleated = prefs
              .getStringList('ff_compleated')
              ?.map((path) => path.ref)
              .toList() ??
          _compleated;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _favourite = [];
  List<DocumentReference> get favourite => _favourite;
  set favourite(List<DocumentReference> value) {
    _favourite = value;
    prefs.setStringList('ff_favourite', value.map((x) => x.path).toList());
  }

  void addToFavourite(DocumentReference value) {
    favourite.add(value);
    prefs.setStringList('ff_favourite', _favourite.map((x) => x.path).toList());
  }

  void removeFromFavourite(DocumentReference value) {
    favourite.remove(value);
    prefs.setStringList('ff_favourite', _favourite.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavourite(int index) {
    favourite.removeAt(index);
    prefs.setStringList('ff_favourite', _favourite.map((x) => x.path).toList());
  }

  void updateFavouriteAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favourite[index] = updateFn(_favourite[index]);
    prefs.setStringList('ff_favourite', _favourite.map((x) => x.path).toList());
  }

  void insertAtIndexInFavourite(int index, DocumentReference value) {
    favourite.insert(index, value);
    prefs.setStringList('ff_favourite', _favourite.map((x) => x.path).toList());
  }

  List<int> _coursecode = [];
  List<int> get coursecode => _coursecode;
  set coursecode(List<int> value) {
    _coursecode = value;
    prefs.setStringList(
        'ff_coursecode', value.map((x) => x.toString()).toList());
  }

  void addToCoursecode(int value) {
    coursecode.add(value);
    prefs.setStringList(
        'ff_coursecode', _coursecode.map((x) => x.toString()).toList());
  }

  void removeFromCoursecode(int value) {
    coursecode.remove(value);
    prefs.setStringList(
        'ff_coursecode', _coursecode.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCoursecode(int index) {
    coursecode.removeAt(index);
    prefs.setStringList(
        'ff_coursecode', _coursecode.map((x) => x.toString()).toList());
  }

  void updateCoursecodeAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    coursecode[index] = updateFn(_coursecode[index]);
    prefs.setStringList(
        'ff_coursecode', _coursecode.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCoursecode(int index, int value) {
    coursecode.insert(index, value);
    prefs.setStringList(
        'ff_coursecode', _coursecode.map((x) => x.toString()).toList());
  }

  String _stage = '';
  String get stage => _stage;
  set stage(String value) {
    _stage = value;
    prefs.setString('ff_stage', value);
  }

  int _deviceid = 0;
  int get deviceid => _deviceid;
  set deviceid(int value) {
    _deviceid = value;
    prefs.setInt('ff_deviceid', value);
  }

  List<DocumentReference> _compleated = [];
  List<DocumentReference> get compleated => _compleated;
  set compleated(List<DocumentReference> value) {
    _compleated = value;
    prefs.setStringList('ff_compleated', value.map((x) => x.path).toList());
  }

  void addToCompleated(DocumentReference value) {
    compleated.add(value);
    prefs.setStringList(
        'ff_compleated', _compleated.map((x) => x.path).toList());
  }

  void removeFromCompleated(DocumentReference value) {
    compleated.remove(value);
    prefs.setStringList(
        'ff_compleated', _compleated.map((x) => x.path).toList());
  }

  void removeAtIndexFromCompleated(int index) {
    compleated.removeAt(index);
    prefs.setStringList(
        'ff_compleated', _compleated.map((x) => x.path).toList());
  }

  void updateCompleatedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    compleated[index] = updateFn(_compleated[index]);
    prefs.setStringList(
        'ff_compleated', _compleated.map((x) => x.path).toList());
  }

  void insertAtIndexInCompleated(int index, DocumentReference value) {
    compleated.insert(index, value);
    prefs.setStringList(
        'ff_compleated', _compleated.map((x) => x.path).toList());
  }
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
