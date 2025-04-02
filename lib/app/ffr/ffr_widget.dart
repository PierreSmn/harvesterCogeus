import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
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
import 'ffr_model.dart';
export 'ffr_model.dart';

class FfrWidget extends StatefulWidget {
  const FfrWidget({
    super.key,
    String? slug,
  }) : this.slug = slug ?? '';

  final String slug;

  static String routeName = 'ffr';
  static String routePath = '/ffr';

  @override
  State<FfrWidget> createState() => _FfrWidgetState();
}

class _FfrWidgetState extends State<FfrWidget> with TickerProviderStateMixin {
  late FfrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasCheckboxTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FfrModel());

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
          slug: () {
            if (widget.slug != '') {
              return widget.slug;
            } else if (FFAppState().slug != '') {
              return FFAppState().slug;
            } else {
              return 'test';
            }
          }(),
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
        final ffrGetSupaResponse = snapshot.data!;

        return Title(
            title: 'ffr',
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
                        ffrGetSupaResponse.jsonBody,
                      )!,
                      defaultColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/BG.jpeg',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
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
                                    ffrGetSupaResponse.jsonBody,
                                  ),
                                  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2016/08/featured.png?auto=format&q=60&w=2060&h=1158.75&fit=crop&crop=faces',
                                ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: GetSupaCall.gift(
                                                ffrGetSupaResponse.jsonBody,
                                              )!,
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                color: colorFromCssString(
                                                  GetSupaCall.colorTitle(
                                                    ffrGetSupaResponse.jsonBody,
                                                  )!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                ),
                                                fontSize: 27.0,
                                                letterSpacing: -1,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (!GetSupaCall.carouselBool(
                                        ffrGetSupaResponse.jsonBody,
                                      )!)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                GetSupaCall.imageURL(
                                                  ffrGetSupaResponse.jsonBody,
                                                ),
                                                'https://picsum.photos/seed/548/600',
                                              ),
                                              width: 350.0,
                                              height: 250.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      if (GetSupaCall.carouselBool(
                                            ffrGetSupaResponse.jsonBody,
                                          ) ??
                                          true)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'En envoyant vous aussi votre vidéo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall.colorText(
                                                            ffrGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: FlutterFlowWebView(
                                                content: valueOrDefault<String>(
                                                  GetSupaCall.carouselCode(
                                                    ffrGetSupaResponse.jsonBody,
                                                  ),
                                                  'noCode',
                                                ),
                                                width: 350.0,
                                                height: 250.0,
                                                verticalScroll: false,
                                                horizontalScroll: false,
                                                html: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 18.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 280.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
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
                                                          unselectedWidgetColor: GetSupaCall
                                                                          .colorButton(
                                                                        ffrGetSupaResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      null &&
                                                                  GetSupaCall
                                                                          .colorButton(
                                                                        ffrGetSupaResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      ''
                                                              ? colorFromCssString(
                                                                  GetSupaCall
                                                                      .colorButton(
                                                                    ffrGetSupaResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .appleButton,
                                                                )
                                                              : FlutterFlowTheme
                                                                      .of(context)
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
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.checked =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          side: BorderSide(
                                                            width: 2,
                                                            color: GetSupaCall
                                                                            .colorButton(
                                                                          ffrGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        null &&
                                                                    GetSupaCall
                                                                            .colorButton(
                                                                          ffrGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        ''
                                                                ? colorFromCssString(
                                                                    GetSupaCall
                                                                        .colorButton(
                                                                      ffrGetSupaResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    defaultColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .appleButton,
                                                                  )
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                          ),
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          checkColor: GetSupaCall
                                                                          .colorButton(
                                                                        ffrGetSupaResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      null &&
                                                                  GetSupaCall
                                                                          .colorButton(
                                                                        ffrGetSupaResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      ''
                                                              ? colorFromCssString(
                                                                  GetSupaCall
                                                                      .colorButton(
                                                                    ffrGetSupaResponse
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
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'J\'accepte les ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  'Conditions Générales',
                                                              style: TextStyle(
                                                                color:
                                                                    colorFromCssString(
                                                                  GetSupaCall
                                                                      .colorButton(
                                                                    ffrGetSupaResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .appleButton,
                                                                ),
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
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                GetSupaCall
                                                                    .brand(
                                                                  ffrGetSupaResponse
                                                                      .jsonBody,
                                                                ),
                                                                'brandName',
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color:
                                                                    colorFromCssString(
                                                                  GetSupaCall
                                                                      .colorText(
                                                                    ffrGetSupaResponse
                                                                        .jsonBody,
                                                                  )!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
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
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    storageFolderPath:
                                                        GetSupaCall.slug(
                                                      ffrGetSupaResponse
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
                                                    safeSetState(() =>
                                                        _model.isDataUploading =
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
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
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
                                                            downloadUrls.first;
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
                                                    FFAppState().questionAsked =
                                                        GetSupaCall.expla(
                                                      ffrGetSupaResponse
                                                          .jsonBody,
                                                    )!;
                                                    FFAppState().videoUrl =
                                                        _model.uploadedFileUrl;
                                                    safeSetState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title:
                                                                Text('Erreur'),
                                                            content: Text(
                                                                'Vous devez séléctionner une vidéo'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    return;
                                                  }

                                                  FFAppState().slug =
                                                      widget.slug;
                                                  FFAppState().brandName =
                                                      GetSupaCall.brand(
                                                    ffrGetSupaResponse.jsonBody,
                                                  )!;
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
                                                        slug: FFAppState().slug,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: GetSupaCall
                                                                  .colorButton(
                                                                ffrGetSupaResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          GetSupaCall
                                                                  .colorButton(
                                                                ffrGetSupaResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              ''
                                                      ? colorFromCssString(
                                                          GetSupaCall
                                                              .colorButton(
                                                            ffrGetSupaResponse
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
                                                                          ffrGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        null &&
                                                                    GetSupaCall
                                                                            .colorButtonText(
                                                                          ffrGetSupaResponse
                                                                              .jsonBody,
                                                                        ) !=
                                                                        ''
                                                                ? colorFromCssString(
                                                                    GetSupaCall
                                                                        .colorButtonText(
                                                                      ffrGetSupaResponse
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
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      if (MediaQuery.sizeOf(context).width >
                                          kBreakpointSmall)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 48.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    BarcodeWidget(
                                                      data:
                                                          'https://app.cogeus.com/home?slug=${widget.slug != '' ? widget.slug : FFAppState().slug}',
                                                      barcode: Barcode.qrCode(),
                                                      width: 240.0,
                                                      height: 160.0,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      color: colorFromCssString(
                                                        GetSupaCall.colorTitle(
                                                          ffrGetSupaResponse
                                                              .jsonBody,
                                                        )!,
                                                        defaultColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 0.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 16.0))
                            .addToStart(SizedBox(height: 10.0)),
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
