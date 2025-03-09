import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/languageselect_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/index.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'vandbfest_copy_model.dart';
export 'vandbfest_copy_model.dart';

class VandbfestCopyWidget extends StatefulWidget {
  const VandbfestCopyWidget({
    super.key,
    String? slug,
  }) : this.slug = slug ?? '';

  final String slug;

  static String routeName = 'vandbfestCopy';
  static String routePath = '/vnbupload';

  @override
  State<VandbfestCopyWidget> createState() => _VandbfestCopyWidgetState();
}

class _VandbfestCopyWidgetState extends State<VandbfestCopyWidget>
    with TickerProviderStateMixin {
  late VandbfestCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasCheckboxTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VandbfestCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(1.0, 1.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: 200.0,
                  width: 160.0,
                  child: LanguageselectWidget(),
                ),
              ),
            ),
          );
        },
      );
    });

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

    return Builder(
      builder: (context) => FutureBuilder<ApiCallResponse>(
        future: FFAppState().api(
          uniqueQueryKey: widget.slug,
          requestFn: () => GetSupaCall.call(
            slug: 'vandbfest',
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
          final vandbfestCopyGetSupaResponse = snapshot.data!;

          return Title(
              title: 'vandbfestCopy',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
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
                              'https://pifcxlqwffdrqcwggoqb.supabase.co/storage/v1/object/public/conversations/ffUploads/1720442986279000.png',
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
                                            text: valueOrDefault<String>(
                                              GetSupaCall.gift(
                                                vandbfestCopyGetSupaResponse
                                                    .jsonBody,
                                              ),
                                              'Tentez de gagner deux pass',
                                            ),
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text:
                                                '\nEn envoyant une vidéo prise pendant le festival',
                                            style: TextStyle(
                                              color: Color(0xFF50B088),
                                              fontSize: 18.0,
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: GetSupaCall.colorTitle(
                                                            vandbfestCopyGetSupaResponse
                                                                .jsonBody,
                                                          ) !=
                                                          null &&
                                                      GetSupaCall.colorTitle(
                                                            vandbfestCopyGetSupaResponse
                                                                .jsonBody,
                                                          ) !=
                                                          ''
                                                  ? colorFromCssString(
                                                      GetSupaCall.colorTitle(
                                                        vandbfestCopyGetSupaResponse
                                                            .jsonBody,
                                                      )!,
                                                      defaultColor:
                                                          Colors.black,
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
                                    FlutterFlowWebView(
                                      content:
                                          '<div id=\"carousel-container\" class=\"carousel-container\">   <script>     window.MyVideoCarouselConfig = {       integrationId: \'83\',        numVideos: 5, disableClick: true};   </script>      <script src=\"https://embeded-pi.vercel.app/embed.js\"></script> </div>',
                                      height: 280.0,
                                      verticalScroll: false,
                                      horizontalScroll: false,
                                      html: true,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
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
                                                          safeSetState(() =>
                                                              _model.checkboxValue =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            _model.checked =
                                                                true;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.checked =
                                                                false;
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        checkColor: GetSupaCall
                                                                        .colorButton(
                                                                      vandbfestCopyGetSupaResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    null &&
                                                                GetSupaCall
                                                                        .colorButton(
                                                                      vandbfestCopyGetSupaResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    ''
                                                            ? colorFromCssString(
                                                                GetSupaCall
                                                                    .colorButton(
                                                                  vandbfestCopyGetSupaResponse
                                                                      .jsonBody,
                                                                )!,
                                                                defaultColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .appleButton,
                                                              )
                                                            : FlutterFlowTheme
                                                                    .of(context)
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
                                                            text:
                                                                'J\'accepte les ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'Conditions Générales',
                                                            style: TextStyle(
                                                              color: GetSupaCall
                                                                              .colorButton(
                                                                            vandbfestCopyGetSupaResponse.jsonBody,
                                                                          ) !=
                                                                          null &&
                                                                      GetSupaCall
                                                                              .colorButton(
                                                                            vandbfestCopyGetSupaResponse.jsonBody,
                                                                          ) !=
                                                                          ''
                                                                  ? colorFromCssString(
                                                                      GetSupaCall
                                                                          .colorButton(
                                                                        vandbfestCopyGetSupaResponse
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
                                                                ' et que ma vidéo apparaisse dans les communications de ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              GetSupaCall.brand(
                                                                vandbfestCopyGetSupaResponse
                                                                    .jsonBody,
                                                              ),
                                                              'brandName',
                                                            ),
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
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      13.0,
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
                                                        SchedulerBinding
                                                            .instance
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
                                                    final selectedMedia =
                                                        await selectMedia(
                                                      storageFolderPath:
                                                          GetSupaCall.slug(
                                                        vandbfestCopyGetSupaResponse
                                                            .jsonBody,
                                                      ),
                                                      isVideo: true,
                                                      mediaSource: MediaSource
                                                          .videoGallery,
                                                      multiImage: false,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            await uploadSupabaseStorageFiles(
                                                          bucketName:
                                                              'submissions',
                                                          selectedFiles:
                                                              selectedMedia,
                                                        );
                                                      } finally {
                                                        _model.isDataUploading =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedFileUrl !=
                                                            '') {
                                                      FFAppState().videoReady =
                                                          true;
                                                      FFAppState()
                                                              .questionAsked =
                                                          GetSupaCall.expla(
                                                        vandbfestCopyGetSupaResponse
                                                            .jsonBody,
                                                      )!;
                                                      FFAppState().videoUrl =
                                                          _model
                                                              .uploadedFileUrl;
                                                      safeSetState(() {});
                                                    }
                                                    FFAppState().slug =
                                                        widget.slug;
                                                    FFAppState().brandName =
                                                        valueOrDefault<String>(
                                                      GetSupaCall.brand(
                                                        vandbfestCopyGetSupaResponse
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
                                                    safeSetState(() {});
                                                    unawaited(
                                                      () async {
                                                        await NewStartCall.call(
                                                          slug:
                                                              FFAppState().slug,
                                                          brand: FFAppState()
                                                              .brandName,
                                                          time:
                                                              getCurrentTimestamp
                                                                  .toString(),
                                                        );
                                                      }(),
                                                    );

                                                    context.pushNamed(
                                                        InfosWidget.routeName);
                                                  },
                                                  text:
                                                      'Je selectionne une vidéo',
                                                  options: FFButtonOptions(
                                                    width: 300.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: GetSupaCall
                                                                    .colorButton(
                                                                  vandbfestCopyGetSupaResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                null &&
                                                            GetSupaCall
                                                                    .colorButton(
                                                                  vandbfestCopyGetSupaResponse
                                                                      .jsonBody,
                                                                ) !=
                                                                ''
                                                        ? colorFromCssString(
                                                            GetSupaCall
                                                                .colorButton(
                                                              vandbfestCopyGetSupaResponse
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
                                                                            vandbfestCopyGetSupaResponse.jsonBody,
                                                                          ) !=
                                                                          null &&
                                                                      GetSupaCall
                                                                              .colorButtonText(
                                                                            vandbfestCopyGetSupaResponse.jsonBody,
                                                                          ) !=
                                                                          ''
                                                                  ? colorFromCssString(
                                                                      GetSupaCall
                                                                          .colorButtonText(
                                                                        vandbfestCopyGetSupaResponse
                                                                            .jsonBody,
                                                                      )!,
                                                                      defaultColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                    )
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              letterSpacing:
                                                                  0.0,
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
                                                        'https://app.cogeus.com/vnbupload?slug=vandbfest',
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 18.0)),
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
      ),
    );
  }
}
