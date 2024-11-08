import '/components/repsnap_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'redir_widget.dart' show RedirWidget;
import 'package:flutter/material.dart';

class RedirModel extends FlutterFlowModel<RedirWidget> {
  ///  Local state fields for this page.

  String? theme;

  String? feedback;

  bool showchat = false;

  bool saidNo = false;

  ///  State fields for stateful widgets in this page.

  // Model for repsnap component.
  late RepsnapModel repsnapModel1;
  // Model for repsnap component.
  late RepsnapModel repsnapModel2;
  // Model for repsnap component.
  late RepsnapModel repsnapModel3;
  // Model for repsnap component.
  late RepsnapModel repsnapModel4;
  // Model for repsnap component.
  late RepsnapModel repsnapModel5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    repsnapModel1 = createModel(context, () => RepsnapModel());
    repsnapModel2 = createModel(context, () => RepsnapModel());
    repsnapModel3 = createModel(context, () => RepsnapModel());
    repsnapModel4 = createModel(context, () => RepsnapModel());
    repsnapModel5 = createModel(context, () => RepsnapModel());
  }

  @override
  void dispose() {
    repsnapModel1.dispose();
    repsnapModel2.dispose();
    repsnapModel3.dispose();
    repsnapModel4.dispose();
    repsnapModel5.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
