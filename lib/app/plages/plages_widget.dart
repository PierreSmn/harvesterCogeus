import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'plages_model.dart';
export 'plages_model.dart';

class PlagesWidget extends StatefulWidget {
  const PlagesWidget({
    super.key,
    String? slug,
  }) : slug = slug ?? '';

  final String slug;

  @override
  State<PlagesWidget> createState() => _PlagesWidgetState();
}

class _PlagesWidgetState extends State<PlagesWidget>
    with TickerProviderStateMixin {
  late PlagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasCheckboxTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlagesModel());

    animationsMap.addAll({
      'checkboxOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 720.0.ms,
            begin: const Offset(0.7, 0.7),
            end: const Offset(1.2, 1.2),
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
        requestFn: () => GetSupaCall.call(
          slug: valueOrDefault<String>(
            widget.slug,
            'lesplages',
          ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFF6970F6),
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
        final plagesGetSupaResponse = snapshot.data!;

        return Title(
            title: 'plages',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: const Color(0xFF6970F6),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1722346082876000.png',
                            height: 110.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          text: GetSupaCall.slug(
                                            plagesGetSupaResponse.jsonBody,
                                          )!,
                                          style: const TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'modal',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const FlutterFlowWebView(
                                    content:
                                        '<div id=\"carousel-container\" class=\"carousel-container\">   <script>     window.MyVideoCarouselConfig = {       integrationId: \'83\',        numVideos: 5, disableClick: true};   </script>      <script src=\"https://embeded-pi.vercel.app/embed.js\"></script> </div>\n',
                                    width: 350.0,
                                    height: 250.0,
                                    verticalScroll: false,
                                    horizontalScroll: false,
                                    html: true,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 18.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 280.0,
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                  child: Checkbox(
                                                    value:
                                                        _model.checkboxValue ??=
                                                            false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() =>
                                                          _model.checkboxValue =
                                                              newValue!);
                                                      if (newValue!) {
                                                        _model.checked = true;
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.checked = false;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    side: BorderSide(
                                                      width: 2,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    checkColor:
                                                        const Color(0xFF00FE60),
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
                                                      const TextSpan(
                                                        text: 'J\'accepte les ',
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Conditions Générales',
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF00FE60),
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
                                                      const TextSpan(
                                                        text:
                                                            ' et que ma vidéo apparaisse dans les communications de ',
                                                        style: TextStyle(),
                                                      ),
                                                      const TextSpan(
                                                        text:
                                                            'Les Plages Electro',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
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
                                                                    from: 0.0));
                                                  }
                                                  return;
                                                }
                                                FFAppState().slug =
                                                    valueOrDefault<String>(
                                                  widget.slug,
                                                  'lesplages',
                                                );
                                                FFAppState().brandName =
                                                    valueOrDefault<String>(
                                                  GetSupaCall.brand(
                                                    plagesGetSupaResponse
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
                                                FFAppState().videoReady = false;
                                                safeSetState(() {});
                                                unawaited(
                                                  () async {
                                                    await NewStartCall.call(
                                                      slug: valueOrDefault<
                                                          String>(
                                                        FFAppState().slug,
                                                        'lesplages',
                                                      ),
                                                      brand: FFAppState()
                                                          .brandName,
                                                      time: getCurrentTimestamp
                                                          .toString(),
                                                    );
                                                  }(),
                                                );

                                                context.pushNamed('production');
                                              },
                                              text: 'J’enregistre ma vidéo',
                                              options: FFButtonOptions(
                                                width: 300.0,
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0xFFE84FBD),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              const Color(0xFFD2FD59),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 12.0)),
                                    ),
                                  ),
                                  if (MediaQuery.sizeOf(context).width >
                                      kBreakpointSmall)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 48.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: const BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                BarcodeWidget(
                                                  data:
                                                      'https://app.cogeus.com/home?slug=${widget.slug != '' ? widget.slug : FFAppState().slug}',
                                                  barcode: Barcode.qrCode(),
                                                  width: 240.0,
                                                  height: 160.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  errorBuilder:
                                                      (context, error) =>
                                                          const SizedBox(
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
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 16.0))
                        .addToStart(const SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
