import '/components/repsnap_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? theme;

  String? feedback;

  bool showchat = false;

  bool saidNo = false;

  String? themeSelected;

  bool themeComplete = false;

  bool showRedirection = false;

  bool showThemeChoiceChat = false;

  bool emailSet = false;

  bool prenomSet = false;

  bool messageSet = false;

  String? email;

  String? prenom;

  String? message;

  bool showEmail = false;

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
  // Model for repsnap component.
  late RepsnapModel repsnapModel6;
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
    repsnapModel6 = createModel(context, () => RepsnapModel());
  }

  @override
  void dispose() {
    repsnapModel1.dispose();
    repsnapModel2.dispose();
    repsnapModel3.dispose();
    repsnapModel4.dispose();
    repsnapModel5.dispose();
    repsnapModel6.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
