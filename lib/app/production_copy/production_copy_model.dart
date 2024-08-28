import '/flutter_flow/flutter_flow_util.dart';
import 'production_copy_widget.dart' show ProductionCopyWidget;
import 'package:flutter/material.dart';

class ProductionCopyModel extends FlutterFlowModel<ProductionCopyWidget> {
  ///  Local state fields for this page.

  String? pageReload;

  int? countTry = 0;

  bool waitforUrl = false;

  bool hideInstruct = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
