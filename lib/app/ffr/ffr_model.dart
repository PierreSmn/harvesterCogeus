import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ffr_widget.dart' show FfrWidget;
import 'package:flutter/material.dart';

class FfrModel extends FlutterFlowModel<FfrWidget> {
  ///  Local state fields for this page.

  bool? checked;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
