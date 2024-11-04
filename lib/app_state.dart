import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _activeBrand = prefs.getString('ff_activeBrand') ?? _activeBrand;
    });
    _safeInit(() {
      _recordVideoFBStorage =
          prefs.getString('ff_recordVideoFBStorage') ?? _recordVideoFBStorage;
    });
    _safeInit(() {
      _name = prefs.getString('ff_name') ?? _name;
    });
    _safeInit(() {
      _surname = prefs.getString('ff_surname') ?? _surname;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      _videoUrl = prefs.getString('ff_videoUrl') ?? _videoUrl;
    });
    _safeInit(() {
      _fromUpload = prefs.getBool('ff_fromUpload') ?? _fromUpload;
    });
    _safeInit(() {
      _slug = prefs.getString('ff_slug') ?? _slug;
    });
    _safeInit(() {
      _brandName = prefs.getString('ff_brandName') ?? _brandName;
    });
    _safeInit(() {
      _validatedDone = prefs.getBool('ff_validatedDone') ?? _validatedDone;
    });
    _safeInit(() {
      _rating = prefs.getDouble('ff_rating') ?? _rating;
    });
    _safeInit(() {
      _questionAsked = prefs.getString('ff_questionAsked') ?? _questionAsked;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _activeBrand = '';
  String get activeBrand => _activeBrand;
  set activeBrand(String value) {
    _activeBrand = value;
    prefs.setString('ff_activeBrand', value);
  }

  bool _isRecording = false;
  bool get isRecording => _isRecording;
  set isRecording(bool value) {
    _isRecording = value;
  }

  String _recordVideoFBStorage = '';
  String get recordVideoFBStorage => _recordVideoFBStorage;
  set recordVideoFBStorage(String value) {
    _recordVideoFBStorage = value;
    prefs.setString('ff_recordVideoFBStorage', value);
  }

  bool _videoReady = false;
  bool get videoReady => _videoReady;
  set videoReady(bool value) {
    _videoReady = value;
  }

  bool _startVideo = false;
  bool get startVideo => _startVideo;
  set startVideo(bool value) {
    _startVideo = value;
  }

  String _lastFileName = '';
  String get lastFileName => _lastFileName;
  set lastFileName(String value) {
    _lastFileName = value;
  }

  String _lastFilePath = '';
  String get lastFilePath => _lastFilePath;
  set lastFilePath(String value) {
    _lastFilePath = value;
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    prefs.setString('ff_name', value);
  }

  String _surname = '';
  String get surname => _surname;
  set surname(String value) {
    _surname = value;
    prefs.setString('ff_surname', value);
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    prefs.setString('ff_email', value);
  }

  String _videoUrl = '';
  String get videoUrl => _videoUrl;
  set videoUrl(String value) {
    _videoUrl = value;
    prefs.setString('ff_videoUrl', value);
  }

  bool _frontCam = false;
  bool get frontCam => _frontCam;
  set frontCam(bool value) {
    _frontCam = value;
  }

  bool _fromUpload = false;
  bool get fromUpload => _fromUpload;
  set fromUpload(bool value) {
    _fromUpload = value;
    prefs.setBool('ff_fromUpload', value);
  }

  String _slug = '';
  String get slug => _slug;
  set slug(String value) {
    _slug = value;
    prefs.setString('ff_slug', value);
  }

  bool _outCamera = false;
  bool get outCamera => _outCamera;
  set outCamera(bool value) {
    _outCamera = value;
  }

  String _brandName = '';
  String get brandName => _brandName;
  set brandName(String value) {
    _brandName = value;
    prefs.setString('ff_brandName', value);
  }

  bool _validatedDone = false;
  bool get validatedDone => _validatedDone;
  set validatedDone(bool value) {
    _validatedDone = value;
    prefs.setBool('ff_validatedDone', value);
  }

  double _rating = 0.0;
  double get rating => _rating;
  set rating(double value) {
    _rating = value;
    prefs.setDouble('ff_rating', value);
  }

  String _questionAsked = '';
  String get questionAsked => _questionAsked;
  set questionAsked(String value) {
    _questionAsked = value;
    prefs.setString('ff_questionAsked', value);
  }

  dynamic _quest;
  dynamic get quest => _quest;
  set quest(dynamic value) {
    _quest = value;
  }

  final _apiManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> api({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _apiManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearApiCache() => _apiManager.clear();
  void clearApiCacheKey(String? uniqueKey) =>
      _apiManager.clearRequest(uniqueKey);
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
