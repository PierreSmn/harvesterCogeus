import '/flutter_flow/flutter_flow_util.dart';
import 'optin_widget.dart' show OptinWidget;
import 'package:flutter/material.dart';

class OptinModel extends FlutterFlowModel<OptinWidget> {
  ///  Local state fields for this page.

  bool? checked;

  bool done = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Entrez une adresse email valide';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Vous devez entrer une adresse email au format valide. ';
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
