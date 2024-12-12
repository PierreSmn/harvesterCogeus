import '/backend/supabase/supabase.dart';
import '/components/nps_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'nps_widget.dart' show NpsWidget;
import 'package:flutter/material.dart';

class NpsModel extends FlutterFlowModel<NpsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in nps widget.
  List<ClientsRow>? client;
  // Stores action output result for [Backend Call - Insert Row] action in nps widget.
  ExperiencesRow? experience;
  // Model for npsItem component.
  late NpsItemModel npsItemModel1;
  // Model for npsItem component.
  late NpsItemModel npsItemModel2;
  // Model for npsItem component.
  late NpsItemModel npsItemModel3;
  // Model for npsItem component.
  late NpsItemModel npsItemModel4;
  // Model for npsItem component.
  late NpsItemModel npsItemModel5;
  // Model for npsItem component.
  late NpsItemModel npsItemModel6;
  // Model for npsItem component.
  late NpsItemModel npsItemModel7;
  // Model for npsItem component.
  late NpsItemModel npsItemModel8;
  // Model for npsItem component.
  late NpsItemModel npsItemModel9;
  // Model for npsItem component.
  late NpsItemModel npsItemModel10;
  // Model for npsItem component.
  late NpsItemModel npsItemModel11;

  @override
  void initState(BuildContext context) {
    npsItemModel1 = createModel(context, () => NpsItemModel());
    npsItemModel2 = createModel(context, () => NpsItemModel());
    npsItemModel3 = createModel(context, () => NpsItemModel());
    npsItemModel4 = createModel(context, () => NpsItemModel());
    npsItemModel5 = createModel(context, () => NpsItemModel());
    npsItemModel6 = createModel(context, () => NpsItemModel());
    npsItemModel7 = createModel(context, () => NpsItemModel());
    npsItemModel8 = createModel(context, () => NpsItemModel());
    npsItemModel9 = createModel(context, () => NpsItemModel());
    npsItemModel10 = createModel(context, () => NpsItemModel());
    npsItemModel11 = createModel(context, () => NpsItemModel());
  }

  @override
  void dispose() {
    npsItemModel1.dispose();
    npsItemModel2.dispose();
    npsItemModel3.dispose();
    npsItemModel4.dispose();
    npsItemModel5.dispose();
    npsItemModel6.dispose();
    npsItemModel7.dispose();
    npsItemModel8.dispose();
    npsItemModel9.dispose();
    npsItemModel10.dispose();
    npsItemModel11.dispose();
  }
}
