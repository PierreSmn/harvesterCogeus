import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'clubadidas_model.dart';
export 'clubadidas_model.dart';

class ClubadidasWidget extends StatefulWidget {
  const ClubadidasWidget({
    super.key,
    String? slug,
  }) : this.slug = slug ?? '';

  final String slug;

  static String routeName = 'clubadidas';
  static String routePath = '/clubadidas';

  @override
  State<ClubadidasWidget> createState() => _ClubadidasWidgetState();
}

class _ClubadidasWidgetState extends State<ClubadidasWidget>
    with TickerProviderStateMixin {
  late ClubadidasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasCheckboxTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubadidasModel());

    animationsMap.addAll({
      'checkboxOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 720.0.ms,
            begin: Offset(0.7, 0.7),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        uniqueQueryKey: widget.slug,
        requestFn: () => GetSupaCall.call(
          slug: 'clubadidas',
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
        final clubadidasGetSupaResponse = snapshot.data!;

        return Title(
            title: 'clubadidas',
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
                            'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1719416098551000.png',
                            height: 110.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Earn ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: GetSupaCall.gift(
                                            clubadidasGetSupaResponse.jsonBody,
                                          )!,
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: GetSupaCall.colorTitle(
                                                          clubadidasGetSupaResponse
                                                              .jsonBody,
                                                        ) !=
                                                        null &&
                                                    GetSupaCall.colorTitle(
                                                          clubadidasGetSupaResponse
                                                              .jsonBody,
                                                        ) !=
                                                        ''
                                                ? colorFromCssString(
                                                    GetSupaCall.colorTitle(
                                                      clubadidasGetSupaResponse
                                                          .jsonBody,
                                                    )!,
                                                    defaultColor: Colors.black,
                                                  )
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontSize: 27.0,
                                            letterSpacing: -1,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.network(
                                      'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1719422253126000.png',
                                      width: 350.0,
                                      height: 250.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 18.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 280.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxValue ??=
                                                          false,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .checkboxValue =
                                                            newValue!);
                                                        if (newValue!) {
                                                          _model.checked = true;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.checked =
                                                              false;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      checkColor: GetSupaCall
                                                                      .colorButton(
                                                                    clubadidasGetSupaResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  null &&
                                                              GetSupaCall
                                                                      .colorButton(
                                                                    clubadidasGetSupaResponse
                                                                        .jsonBody,
                                                                  ) !=
                                                                  ''
                                                          ? colorFromCssString(
                                                              GetSupaCall
                                                                  .colorButton(
                                                                clubadidasGetSupaResponse
                                                                    .jsonBody,
                                                              )!,
                                                              defaultColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .appleButton,
                                                            )
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .appleButton,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'checkboxOnActionTriggerAnimation']!,
                                                      hasBeenTriggered:
                                                          hasCheckboxTriggered),
                                                ),
                                                Flexible(
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'I accept the ',
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'General Terms and Conditions ',
                                                          style: TextStyle(
                                                            color: GetSupaCall
                                                                            .colorButton(
                                                                          clubadidasGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        null &&
                                                                    GetSupaCall
                                                                            .colorButton(
                                                                          clubadidasGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        ''
                                                                ? colorFromCssString(
                                                                    GetSupaCall
                                                                        .colorButton(
                                                                      clubadidasGetSupaResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    defaultColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .appleButton,
                                                                  )
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .appleButton,
                                                          ),
                                                          mouseCursor:
                                                              SystemMouseCursors
                                                                  .click,
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap =
                                                                    () async {
                                                                  await launchURL(
                                                                      'https://www.cogeus.com/terms-of-use');
                                                                },
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              'and that my video might be used by Adidas',
                                                          style: TextStyle(),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.checked =
                                                      _model.checkboxValue;
                                                  safeSetState(() {});
                                                  if (!_model.checked!) {
                                                    if (animationsMap[
                                                            'checkboxOnActionTriggerAnimation'] !=
                                                        null) {
                                                      safeSetState(() =>
                                                          hasCheckboxTriggered =
                                                              true);
                                                      SchedulerBinding.instance
                                                          .addPostFrameCallback((_) async =>
                                                              await animationsMap[
                                                                      'checkboxOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                    }
                                                    return;
                                                  }
                                                  FFAppState().slug =
                                                      'clubadidas';
                                                  FFAppState().brandName =
                                                      valueOrDefault<String>(
                                                    GetSupaCall.brand(
                                                      clubadidasGetSupaResponse
                                                          .jsonBody,
                                                    ),
                                                    'unset',
                                                  );
                                                  FFAppState().validatedDone =
                                                      false;
                                                  FFAppState().isRecording =
                                                      false;
                                                  FFAppState()
                                                      .recordVideoFBStorage = '';
                                                  FFAppState().videoReady =
                                                      false;
                                                  safeSetState(() {});
                                                  unawaited(
                                                    () async {
                                                      await NewStartCall.call(
                                                        slug: 'clubadidas',
                                                        brand: FFAppState()
                                                            .brandName,
                                                        time:
                                                            getCurrentTimestamp
                                                                .toString(),
                                                      );
                                                    }(),
                                                  );

                                                  context.pushNamed(
                                                      ProductionWidget
                                                          .routeName);
                                                },
                                                text: 'Record my video',
                                                options: FFButtonOptions(
                                                  width: 300.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: GetSupaCall
                                                                  .colorButton(
                                                                clubadidasGetSupaResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          GetSupaCall
                                                                  .colorButton(
                                                                clubadidasGetSupaResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              ''
                                                      ? colorFromCssString(
                                                          GetSupaCall
                                                              .colorButton(
                                                            clubadidasGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .appleButton,
                                                        )
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .appleButton,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            color: GetSupaCall
                                                                            .colorButtonText(
                                                                          clubadidasGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        null &&
                                                                    GetSupaCall
                                                                            .colorButtonText(
                                                                          clubadidasGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        ''
                                                                ? colorFromCssString(
                                                                    GetSupaCall
                                                                        .colorButtonText(
                                                                      clubadidasGetSupaResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    defaultColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                  )
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  if (MediaQuery.sizeOf(context).width >
                                      kBreakpointSmall)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 48.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BarcodeWidget(
                                                  data:
                                                      'https://app.cogeus.com/clubadidas',
                                                  barcode: Barcode.qrCode(),
                                                  width: 240.0,
                                                  height: 160.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  errorBuilder:
                                                      (_context, _error) =>
                                                          SizedBox(
                                                    width: 240.0,
                                                    height: 160.0,
                                                  ),
                                                  drawText: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Scannez ce code pour\n continuer sur un téléphone',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 24.0)),
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
