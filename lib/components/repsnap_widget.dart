import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'repsnap_model.dart';
export 'repsnap_model.dart';

class RepsnapWidget extends StatefulWidget {
  const RepsnapWidget({
    super.key,
    String? content,
    bool? isSystemTalking,
    this.brandName,
  })  : content = content ?? '',
        isSystemTalking = isSystemTalking ?? true;

  final String content;
  final bool isSystemTalking;
  final String? brandName;

  @override
  State<RepsnapWidget> createState() => _RepsnapWidgetState();
}

class _RepsnapWidgetState extends State<RepsnapWidget> {
  late RepsnapModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RepsnapModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
          child: Text(
            valueOrDefault<String>(
              widget.isSystemTalking
                  ? valueOrDefault<String>(
                      widget.brandName,
                      'noName',
                    )
                  : 'Moi',
              'none',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Avenir Next',
                  color: widget.isSystemTalking
                      ? FlutterFlowTheme.of(context).accent4
                      : FlutterFlowTheme.of(context).rougeMalongo,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: false,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: widget.isSystemTalking
                                ? FlutterFlowTheme.of(context).accent4
                                : FlutterFlowTheme.of(context).rougeMalongo,
                            offset: const Offset(
                              -2.5,
                              0.0,
                            ),
                            spreadRadius: 0.0,
                          )
                        ],
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 0.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: Text(
                          widget.content,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Avenir Next',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 6.0)),
          ),
        ),
      ],
    );
  }
}
