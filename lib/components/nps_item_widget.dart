import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nps_item_model.dart';
export 'nps_item_model.dart';

class NpsItemWidget extends StatefulWidget {
  const NpsItemWidget({
    super.key,
    required this.nps,
    this.email,
    required this.clid,
    this.name,
    this.color,
  });

  final int? nps;
  final String? email;
  final int? clid;
  final String? name;
  final Color? color;

  @override
  State<NpsItemWidget> createState() => _NpsItemWidgetState();
}

class _NpsItemWidgetState extends State<NpsItemWidget> {
  late NpsItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NpsItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.client = await ClientsTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.clid,
          ),
        );
        _model.experience = await ExperiencesTable().insert({
          'nps': widget.nps,
          'client_id': _model.client?.firstOrNull?.brandId != null
              ? _model.client?.firstOrNull?.brandId
              : widget.clid,
          'email': valueOrDefault<String>(
            widget.email,
            'noEmail',
          ),
          'full_name': widget.name,
          'np1_id': _model.client?.firstOrNull?.np1Id,
          'np2_id': _model.client?.firstOrNull?.np2Id,
          'bu_id': _model.client?.firstOrNull?.buId,
          'loc_id': _model.client?.firstOrNull?.locId,
        });
        FFAppState().expId = _model.experience!.id;
        safeSetState(() {});

        context.pushNamed(
          'chat',
          queryParameters: {
            'nps': serializeParam(
              widget.nps,
              ParamType.int,
            ),
            'xId': serializeParam(
              _model.experience?.id,
              ParamType.int,
            ),
            'clid': serializeParam(
              widget.clid,
              ParamType.int,
            ),
          }.withoutNulls,
        );

        safeSetState(() {});
      },
      child: Container(
        height: 36.0,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.75,
        ),
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.color,
            FlutterFlowTheme.of(context).accent4,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.nps?.toString(),
                  '0',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Avenir Next',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
              if (widget.nps == 10)
                Text(
                  '- Très probable',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Avenir Next',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 16.0,
                        letterSpacing: FFAppConstants.spacing,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              if (widget.nps == 0)
                Text(
                  '- Pas du tout probable',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Avenir Next',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 16.0,
                        letterSpacing: FFAppConstants.spacing,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
            ].divide(SizedBox(width: 6.0)),
          ),
        ),
      ),
    );
  }
}
