import '/backend/supabase/supabase.dart';
import '/components/nps_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'nps_model.dart';
export 'nps_model.dart';

class NpsWidget extends StatefulWidget {
  const NpsWidget({
    super.key,
    required this.clid,
  });

  final int? clid;

  @override
  State<NpsWidget> createState() => _NpsWidgetState();
}

class _NpsWidgetState extends State<NpsWidget> {
  late NpsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NpsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClientsRow>>(
      future: ClientsTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.clid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<ClientsRow> npsClientsRowList = snapshot.data!;

        final npsClientsRow =
            npsClientsRowList.isNotEmpty ? npsClientsRowList.first : null;

        return Title(
            title: 'nps',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 40.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                npsClientsRow!.logoUrl!,
                                height: 110.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text:
                                        'Sur une échelle de 0 à 10, quelle est la probabilité que vous recommandiez ',
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      npsClientsRow.name,
                                      'brandName',
                                    ),
                                    style: const TextStyle(),
                                  ),
                                  const TextSpan(
                                    text: ' à un ami ? ',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Text(
                              '10 = Très probable, 0 = Pas dutout',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  wrapWithModel(
                                    model: _model.npsItemModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 10,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 9,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 8,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 7,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 6,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel6,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 5,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel7,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 4,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel8,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 3,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel9,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 2,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel10,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 1,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.npsItemModel11,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NpsItemWidget(
                                      nps: 0,
                                      clid: widget.clid!,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
