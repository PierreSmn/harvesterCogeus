import '/flutter_flow/flutter_flow_util.dart';
import 'vandbfest_copy_widget.dart' show VandbfestCopyWidget;
import 'package:flutter/material.dart';

class VandbfestCopyModel extends FlutterFlowModel<VandbfestCopyWidget> {
  ///  Local state fields for this page.

  bool? checked;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
