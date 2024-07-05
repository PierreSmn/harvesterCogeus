import '/flutter_flow/flutter_flow_util.dart';
import 'carousel_widget.dart' show CarouselWidget;
import 'package:flutter/material.dart';

class CarouselModel extends FlutterFlowModel<CarouselWidget> {
  ///  Local state fields for this page.

  bool? checked;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
