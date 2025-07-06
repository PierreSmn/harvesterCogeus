// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:intl/intl.dart'; // Ensure you have this import for DateFormat
import '../../flutter_flow/upload_data.dart';
import 'package:camera/camera.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart'; // ← pull in DeviceOrientation

class CameraRecord extends StatefulWidget {
  const CameraRecord({
    Key? key,
    this.width,
    this.height,
    required this.control,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int control;

  @override
  _CameraRecordState createState() => _CameraRecordState();
}

class _CameraRecordState extends State<CameraRecord>
    with WidgetsBindingObserver {
  CameraController? controller;
  late Future<List<CameraDescription>> _cameras;

  @override
  void initState() {
    super.initState();
    _cameras = availableCameras();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // When the app is resumed, reinitialize the camera
      if (controller != null && !controller!.value.isInitialized) {
        controller!.initialize().then((_) {
          setState(() {}); // Refresh the UI when camera is reinitialized
        }).catchError((error) {
          print('Error reinitializing the camera: $error');
        });
      }
    } else if (state == AppLifecycleState.hidden) {
      // When the app is paused, stop and dispose the camera
      stopAndDisposeCameraController();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stopAndDisposeCameraController(); // Call to stop and dispose the camera
    super.dispose();
  }

  void stopAndDisposeCameraController() async {
    if (controller != null) {
      if (controller!.value.isRecordingVideo) {
        await controller!.stopVideoRecording();
      }
      await controller!.dispose();
      controller = null;
    }
  }

  @override
  void didUpdateWidget(covariant CameraRecord oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (FFAppState().isRecording && !controller!.value.isRecordingVideo) {
      controller!.prepareForVideoRecording();
      controller!.startVideoRecording().then((_) {}).catchError((error) {});
    } else if (!FFAppState().isRecording &&
        controller != null &&
        controller!.value.isRecordingVideo) {
      controller!.stopVideoRecording().then((file) async {
        Uint8List fileAsBytes = await file.readAsBytes();
        setState(() {
          FFAppState().isRecording = false;
        });
        final dateFolderName =
            DateFormat('dd-MM-yyyy_HH:mm:ss_').format(DateTime.now());
        final videoPrefix = FFAppState().slug;
        final fileName = "/$videoPrefix/$dateFolderName-" + file.name;

        final fileOptions = FileOptions(
          contentType: 'video/mp4',
        );
        final supabase = Supabase.instance.client;
        final url = await supabase.storage
            .from('submissions')
            .uploadBinary(fileName, fileAsBytes, fileOptions: fileOptions);
        FFAppState().recordVideoFBStorage = await url ?? '';
        FFAppState().videoReady = true;
      }).catchError((error) {
        print('Error stopping video recording or uploading: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
        future: _cameras,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              if (controller == null) {
                controller = CameraController(
                  snapshot.data![widget.control],
                  ResolutionPreset.veryHigh,
                );
                controller!.initialize().then((_) async {
                  if (!mounted) return;
                  // **LOCK** into portrait
                  try {
                    await controller!
                        .lockCaptureOrientation(DeviceOrientation.portraitUp);
                  } catch (e) {
                    print("Couldn't lock orientation: $e");
                  }
                  setState(() {});
                });
              }

              // Ensure controller is initialized before showing CameraPreview
              return controller!.value.isInitialized
                  ? CameraPreview(controller!)
                  : Container(); // Return a placeholder or loading indicator as needed
            } else {
              return Center(child: Text('No cameras available.'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
