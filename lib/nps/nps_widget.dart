import '/backend/supabase/supabase.dart';
import '/components/nps_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nps_model.dart';
export 'nps_model.dart';

class NpsWidget extends StatefulWidget {
  const NpsWidget({
    super.key,
    required this.clid,
    this.nps,
    this.email,
    this.name,
    this.product,
    this.lastname,
    this.orderId,
  });

  final int? clid;
  final int? nps;
  final String? email;
  final String? name;
  final String? product;
  final String? lastname;
  final String? orderId;

  static String routeName = 'nps';
  static String routePath = '/nps';

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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.nps != null) {
        if ((FFAppState().expId == 0) || (FFAppState().expId == null)) {
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
            'email': widget.email,
            'full_name': widget.name,
            'bu_id': _model.client?.firstOrNull?.buId,
            'loc_id': _model.client?.firstOrNull?.locId,
            'first_name': widget.name,
            'last_name': widget.lastname,
            'product': widget.product,
            'orderId': widget.orderId,
          });
          FFAppState().expId = _model.experience!.id;
          safeSetState(() {});

          context.pushNamed(
            ChatWidget.routeName,
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
        } else {
          await ExperiencesTable().update(
            data: {
              'nps': widget.nps,
            },
            matchingRows: (rows) => rows.eqOrNull(
              'id',
              FFAppState().expId,
            ),
          );

          context.pushNamed(
            ChatWidget.routeName,
            queryParameters: {
              'nps': serializeParam(
                widget.nps,
                ParamType.int,
              ),
              'xId': serializeParam(
                FFAppState().expId,
                ParamType.int,
              ),
              'clid': serializeParam(
                widget.clid,
                ParamType.int,
              ),
            }.withoutNulls,
          );
        }
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ClientsRow>>(
      future: ClientsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
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
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350.0,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                              Container(
                                width: 350.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Sur une échelle de 0 à 10, quelle est la probabilité que vous recommandiez ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            npsClientsRow.name,
                                            'brandName',
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: ' à un ami ? ',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      wrapWithModel(
                                        model: _model.npsItemModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 10,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel2,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 9,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 8,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel4,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 7,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel5,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 6,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel6,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 5,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel7,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 4,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel8,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 3,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel9,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 2,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel10,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 1,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.npsItemModel11,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NpsItemWidget(
                                          nps: 0,
                                          clid: widget.clid!,
                                          color: npsClientsRow.color != null &&
                                                  npsClientsRow.color != ''
                                              ? colorFromCssString(
                                                  npsClientsRow.color!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
