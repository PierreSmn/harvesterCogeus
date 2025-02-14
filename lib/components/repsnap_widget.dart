import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'repsnap_model.dart';
export 'repsnap_model.dart';

class RepsnapWidget extends StatefulWidget {
  const RepsnapWidget({
    super.key,
    String? content,
    bool? isUserTalking,
  })  : this.content = content ?? '',
        this.isUserTalking = isUserTalking ?? true;

  final String content;
  final bool isUserTalking;

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
          padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: widget.isUserTalking
                                ? FlutterFlowTheme.of(context).accent4
                                : FlutterFlowTheme.of(context).rougeMalongo,
                            offset: Offset(
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 2.0, 0.0, 1.0),
                            child: Text(
                              widget.content,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Avenir Next',
                                    fontSize: 18.0,
                                    letterSpacing: FFAppConstants.spacing,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 6.0)),
          ),
        ),
      ],
    );
  }
}
