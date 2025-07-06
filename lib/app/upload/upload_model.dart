import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'upload_widget.dart' show UploadWidget;
import 'package:flutter/material.dart';

class UploadModel extends FlutterFlowModel<UploadWidget> {
  ///  Local state fields for this page.

  bool? checked;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  bool isDataUploading_uploadData3u2 = false;
  FFUploadedFile uploadedLocalFile_uploadData3u2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData3u2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
