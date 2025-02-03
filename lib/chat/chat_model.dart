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

  String? autreExpressed;

  bool showAutre = false;

  bool saidNoTwice = false;

  bool saidNoTrice = false;

  bool saidYes = false;

  bool noRecontact = false;

  bool askEmail = false;

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
  // Model for repsnap component.
  late RepsnapModel repsnapModel7;
  // Model for repsnap component.
  late RepsnapModel repsnapModel8;
  // Model for repsnap component.
  late RepsnapModel repsnapModel9;
  // Model for repsnap component.
  late RepsnapModel repsnapModel10;
  // Model for repsnap component.
  late RepsnapModel repsnapModel11;
  // Model for repsnap component.
  late RepsnapModel repsnapModel12;
  // Model for repsnap component.
  late RepsnapModel repsnapModel13;
  // Model for repsnap component.
  late RepsnapModel repsnapModel14;
  // Model for repsnap component.
  late RepsnapModel repsnapModel15;
  // Model for repsnap component.
  late RepsnapModel repsnapModel16;
  // Model for repsnap component.
  late RepsnapModel repsnapModel17;
  // Model for repsnap component.
  late RepsnapModel repsnapModel18;
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
    repsnapModel7 = createModel(context, () => RepsnapModel());
    repsnapModel8 = createModel(context, () => RepsnapModel());
    repsnapModel9 = createModel(context, () => RepsnapModel());
    repsnapModel10 = createModel(context, () => RepsnapModel());
    repsnapModel11 = createModel(context, () => RepsnapModel());
    repsnapModel12 = createModel(context, () => RepsnapModel());
    repsnapModel13 = createModel(context, () => RepsnapModel());
    repsnapModel14 = createModel(context, () => RepsnapModel());
    repsnapModel15 = createModel(context, () => RepsnapModel());
    repsnapModel16 = createModel(context, () => RepsnapModel());
    repsnapModel17 = createModel(context, () => RepsnapModel());
    repsnapModel18 = createModel(context, () => RepsnapModel());
  }

  @override
  void dispose() {
    repsnapModel1.dispose();
    repsnapModel2.dispose();
    repsnapModel3.dispose();
    repsnapModel4.dispose();
    repsnapModel5.dispose();
    repsnapModel6.dispose();
    repsnapModel7.dispose();
    repsnapModel8.dispose();
    repsnapModel9.dispose();
    repsnapModel10.dispose();
    repsnapModel11.dispose();
    repsnapModel12.dispose();
    repsnapModel13.dispose();
    repsnapModel14.dispose();
    repsnapModel15.dispose();
    repsnapModel16.dispose();
    repsnapModel17.dispose();
    repsnapModel18.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
