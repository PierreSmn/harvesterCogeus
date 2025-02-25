import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'done_model.dart';
export 'done_model.dart';

class DoneWidget extends StatefulWidget {
  const DoneWidget({super.key});

  static String routeName = 'done';
  static String routePath = '/done';

  @override
  State<DoneWidget> createState() => _DoneWidgetState();
}

class _DoneWidgetState extends State<DoneWidget> {
  late DoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoneModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().validatedDone) {
        context.safePop();
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

    return FutureBuilder<ApiCallResponse>(
      future: FFAppState().api(
        uniqueQueryKey: FFAppState().slug,
        requestFn: () => GetSupaCall.call(
          slug: FFAppState().slug,
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
        final doneGetSupaResponse = snapshot.data!;

        return Title(
            title: 'done',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: Container(
                  decoration: BoxDecoration(
                    color: colorFromCssString(
                      GetSupaCall.colorBG(
                        doneGetSupaResponse.jsonBody,
                      )!,
                      defaultColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              GetSupaCall.logoURL(
                                doneGetSupaResponse.jsonBody,
                              ),
                              'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1720442986279000.png',
                            ),
                            height: 90.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 30.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 400.0,
                                    decoration: BoxDecoration(),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'Merci de votre participation !',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: colorFromCssString(
                                                GetSupaCall.colorTitle(
                                                  doneGetSupaResponse.jsonBody,
                                                )!,
                                                defaultColor: Colors.black,
                                              ),
                                              fontSize: 27.0,
                                              letterSpacing: -1,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  if (FFAppState().slug != 'vandbfest')
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.network(
                                        GetSupaCall.imageURL(
                                          doneGetSupaResponse.jsonBody,
                                        )!,
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  if (GetSupaCall.twogifts(
                                        doneGetSupaResponse.jsonBody,
                                      ) ==
                                      false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 0.0),
                                      child: Container(
                                        width: 400.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Cliquez ci-dessous pour copier le code qui vous offre ',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: GetSupaCall
                                                        .descriptionCodePromo(
                                                      doneGetSupaResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      color: colorFromCssString(
                                                        GetSupaCall.colorText(
                                                          doneGetSupaResponse
                                                              .jsonBody,
                                                        )!,
                                                        defaultColor:
                                                            Colors.black,
                                                      ),
                                                      fontSize: 16.7,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await Clipboard.setData(
                                                    ClipboardData(
                                                        text: GetSupaCall
                                                            .codePromo(
                                                  doneGetSupaResponse.jsonBody,
                                                )!));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Le code a bien été copié!',
                                                      style: TextStyle(
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall
                                                              .colorButtonText(
                                                            doneGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        colorFromCssString(
                                                      GetSupaCall.colorButton(
                                                        doneGetSupaResponse
                                                            .jsonBody,
                                                      )!,
                                                      defaultColor:
                                                          Colors.black,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.content_copy_outlined,
                                                    color: colorFromCssString(
                                                      GetSupaCall.colorTitle(
                                                        doneGetSupaResponse
                                                            .jsonBody,
                                                      )!,
                                                      defaultColor:
                                                          Colors.black,
                                                    ),
                                                    size: 26.0,
                                                  ),
                                                  Text(
                                                    GetSupaCall.codePromo(
                                                      doneGetSupaResponse
                                                          .jsonBody,
                                                    )!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              colorFromCssString(
                                                            GetSupaCall
                                                                .colorTitle(
                                                              doneGetSupaResponse
                                                                  .jsonBody,
                                                            )!,
                                                            defaultColor:
                                                                Colors.black,
                                                          ),
                                                          fontSize: 21.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: GetSupaCall
                                                              .codePromo(
                                                    doneGetSupaResponse
                                                        .jsonBody,
                                                  )!));
                                                  await launchURL(
                                                      GetSupaCall.ctaUrl(
                                                    doneGetSupaResponse
                                                        .jsonBody,
                                                  )!);
                                                },
                                                text: 'Aller sur le site',
                                                icon: Icon(
                                                  Icons.exit_to_app,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: colorFromCssString(
                                                    GetSupaCall.colorButton(
                                                      doneGetSupaResponse
                                                          .jsonBody,
                                                    )!,
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall
                                                              .colorButtonText(
                                                            doneGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().slug == 'vandbfest')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 0.0),
                                      child: Container(
                                        width: 400.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Augmentez vos chances de gagner en envoyant une vidéo supplémentaire',
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      color: colorFromCssString(
                                                        GetSupaCall.colorText(
                                                          doneGetSupaResponse
                                                              .jsonBody,
                                                        )!,
                                                        defaultColor:
                                                            Colors.black,
                                                      ),
                                                      fontSize: 16.7,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    VandbfestCopyWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'slug': serializeParam(
                                                        'vandbfest',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                text:
                                                    'Envoyer une nouvelle vidéo',
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFED6F5E),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall
                                                              .colorButtonText(
                                                            doneGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 14.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .addToStart(SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
