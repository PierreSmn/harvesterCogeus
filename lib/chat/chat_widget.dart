import '';
import '/backend/supabase/supabase.dart';
import '/components/feedback_widget.dart';
import '/components/repsnap_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.nps,
    required this.xId,
    this.clid,
  });

  final int? nps;
  final int? xId;
  final int? clid;

  static String routeName = 'chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'repsnapOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 750.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1800.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'conditionalBuilderOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1020.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 830.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 830.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
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
        List<ClientsRow> chatClientsRowList = snapshot.data!;

        final chatClientsRow =
            chatClientsRowList.isNotEmpty ? chatClientsRowList.first : null;

        return Title(
            title: 'chat',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width *
                                              0.65,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            chatClientsRow!.logoUrl!,
                                            height: 70.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 16.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      chatClientsRow.name,
                                                      'Marque',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Avenir Next',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .rougeMalongo,
                                                          fontSize: 22.0,
                                                          letterSpacing:
                                                              FFAppConstants
                                                                  .spacing,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: wrapWithModel(
                                                model: _model.repsnapModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RepsnapWidget(
                                                  content: () {
                                                    if (widget.nps! >= 9) {
                                                      return 'Merci d\'être un de nos ambassadeurs !';
                                                    } else if (widget.nps! <=
                                                        6) {
                                                      return 'Nous sommes désolés que notre service n\'ait pas répondu à vos attentes.';
                                                    } else {
                                                      return 'Ravi d\'apprendre que vous êtes prêt à parler de nous à vos proches !';
                                                    }
                                                  }(),
                                                  isUserTalking: false,
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation']!),
                                            wrapWithModel(
                                              model: _model.repsnapModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: RepsnapWidget(
                                                content:
                                                    'Quelle est la raison principale de votre note de ${widget.nps?.toString()} ?',
                                                isUserTalking: false,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'repsnapOnPageLoadAnimation']!),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (!_model.themeComplete)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.themeSelected =
                                                            valueOrDefault<
                                                                String>(
                                                          chatClientsRow
                                                              .theme1,
                                                          'Qualité',
                                                        );
                                                        _model.themeComplete =
                                                            true;
                                                        _model.showThemeChoiceChat =
                                                            true;
                                                        _model.showchat = false;
                                                        safeSetState(() {});
                                                        unawaited(
                                                          () async {
                                                            await ExperiencesTable()
                                                                .update(
                                                              data: {
                                                                'theme':
                                                                    valueOrDefault<
                                                                        String>(
                                                                  chatClientsRow
                                                                      .theme1,
                                                                  'Qualité',
                                                                ),
                                                                'theme_choice':
                                                                    1,
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                FFAppState()
                                                                    .expId,
                                                              ),
                                                            );
                                                          }(),
                                                        );
                                                        if (animationsMap[
                                                                'conditionalBuilderOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'conditionalBuilderOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 36.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.85,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: chatClientsRow
                                                                          .color !=
                                                                      null &&
                                                                  chatClientsRow
                                                                          .color !=
                                                                      ''
                                                              ? colorFromCssString(
                                                                  chatClientsRow
                                                                      .color!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                )
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  chatClientsRow
                                                                      .theme1,
                                                                  'Qualité',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 35,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Avenir Next',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          FFAppConstants
                                                                              .spacing,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.themeSelected =
                                                            valueOrDefault<
                                                                String>(
                                                          chatClientsRow
                                                              .theme2,
                                                          'Fiabilité',
                                                        );
                                                        _model.themeComplete =
                                                            true;
                                                        _model.showThemeChoiceChat =
                                                            true;
                                                        _model.showchat = false;
                                                        safeSetState(() {});
                                                        unawaited(
                                                          () async {
                                                            await ExperiencesTable()
                                                                .update(
                                                              data: {
                                                                'theme':
                                                                    valueOrDefault<
                                                                        String>(
                                                                  chatClientsRow
                                                                      .theme2,
                                                                  'Fiabilité',
                                                                ),
                                                                'theme_choice':
                                                                    2,
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                FFAppState()
                                                                    .expId,
                                                              ),
                                                            );
                                                          }(),
                                                        );
                                                        if (animationsMap[
                                                                'conditionalBuilderOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'conditionalBuilderOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 36.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.85,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: chatClientsRow
                                                                          .color !=
                                                                      null &&
                                                                  chatClientsRow
                                                                          .color !=
                                                                      ''
                                                              ? colorFromCssString(
                                                                  chatClientsRow
                                                                      .color!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                )
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  chatClientsRow
                                                                      .theme2,
                                                                  'Fiabilité',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 35,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Avenir Next',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          FFAppConstants
                                                                              .spacing,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.themeSelected =
                                                            valueOrDefault<
                                                                String>(
                                                          chatClientsRow
                                                              .theme3,
                                                          'Service Client',
                                                        );
                                                        _model.themeComplete =
                                                            true;
                                                        _model.showThemeChoiceChat =
                                                            true;
                                                        _model.showchat = false;
                                                        safeSetState(() {});
                                                        unawaited(
                                                          () async {
                                                            await ExperiencesTable()
                                                                .update(
                                                              data: {
                                                                'theme':
                                                                    valueOrDefault<
                                                                        String>(
                                                                  chatClientsRow
                                                                      .theme3,
                                                                  'Service Client',
                                                                ),
                                                                'theme_choice':
                                                                    3,
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                FFAppState()
                                                                    .expId,
                                                              ),
                                                            );
                                                          }(),
                                                        );
                                                        if (animationsMap[
                                                                'conditionalBuilderOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'conditionalBuilderOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 36.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.85,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: chatClientsRow
                                                                          .color !=
                                                                      null &&
                                                                  chatClientsRow
                                                                          .color !=
                                                                      ''
                                                              ? colorFromCssString(
                                                                  chatClientsRow
                                                                      .color!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                )
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  chatClientsRow
                                                                      .theme3,
                                                                  'Service Client',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 35,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Avenir Next',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          FFAppConstants
                                                                              .spacing,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.themeSelected =
                                                            valueOrDefault<
                                                                String>(
                                                          chatClientsRow
                                                              .theme4,
                                                          'Facilité d\'utilisation',
                                                        );
                                                        _model.themeComplete =
                                                            true;
                                                        _model.showThemeChoiceChat =
                                                            true;
                                                        _model.showchat = false;
                                                        safeSetState(() {});
                                                        unawaited(
                                                          () async {
                                                            await ExperiencesTable()
                                                                .update(
                                                              data: {
                                                                'theme':
                                                                    valueOrDefault<
                                                                        String>(
                                                                  chatClientsRow
                                                                      .theme4,
                                                                  'Facilité d\'utilisation',
                                                                ),
                                                                'theme_choice':
                                                                    4,
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                FFAppState()
                                                                    .expId,
                                                              ),
                                                            );
                                                          }(),
                                                        );
                                                        if (animationsMap[
                                                                'conditionalBuilderOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'conditionalBuilderOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 36.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.85,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: chatClientsRow
                                                                          .color !=
                                                                      null &&
                                                                  chatClientsRow
                                                                          .color !=
                                                                      ''
                                                              ? colorFromCssString(
                                                                  chatClientsRow
                                                                      .color!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                )
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  chatClientsRow
                                                                      .theme4,
                                                                  'Facilité d\'utilisation',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 35,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Avenir Next',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          FFAppConstants
                                                                              .spacing,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.themeSelected =
                                                            'Autre';
                                                        _model.showThemeChoiceChat =
                                                            true;
                                                        _model.showchat = true;
                                                        safeSetState(() {});
                                                        unawaited(
                                                          () async {
                                                            await ExperiencesTable()
                                                                .update(
                                                              data: {
                                                                'theme':
                                                                    'Autre',
                                                                'theme_choice':
                                                                    5,
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                FFAppState()
                                                                    .expId,
                                                              ),
                                                            );
                                                          }(),
                                                        );
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 36.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.85,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: chatClientsRow
                                                                          .color !=
                                                                      null &&
                                                                  chatClientsRow
                                                                          .color !=
                                                                      ''
                                                              ? colorFromCssString(
                                                                  chatClientsRow
                                                                      .color!,
                                                                  defaultColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                )
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  _model.showchat =
                                                                      true;
                                                                  _model.feedback =
                                                                      null;
                                                                  _model.themeSelected =
                                                                      'Autre';
                                                                  _model.themeComplete =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Text(
                                                                  'Autre',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Avenir Next',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            FFAppConstants.spacing,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(height: 6.0))
                                                      .addToStart(SizedBox(
                                                          height: 12.0)),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'rowOnPageLoadAnimation']!),
                                          if (_model.showThemeChoiceChat)
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Moi',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Avenir Next',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    FFAppConstants
                                                                        .spacing,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  wrapWithModel(
                                                    model: _model.repsnapModel3,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RepsnapWidget(
                                                      content:
                                                          _model.themeSelected!,
                                                      isUserTalking: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (_model.showThemeChoiceChat &&
                                              (_model.themeSelected == 'Autre'))
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            chatClientsRow
                                                                .name,
                                                            'Marque',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Avenir Next',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .rougeMalongo,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    FFAppConstants
                                                                        .spacing,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  wrapWithModel(
                                                    model: _model.repsnapModel4,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RepsnapWidget(
                                                      content:
                                                          'Quelle-est cette \"Autre\" raison ? ',
                                                      isUserTalking: false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (_model.showAutre)
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Text(
                                                          'Moi',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Avenir Next',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    FFAppConstants
                                                                        .spacing,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  wrapWithModel(
                                                    model: _model.repsnapModel5,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RepsnapWidget(
                                                      content: _model
                                                          .autreExpressed!,
                                                      isUserTalking: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (chatClientsRow.slugHarvester !=
                                                  null &&
                                              chatClientsRow.slugHarvester !=
                                                  '') {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatClientsRow
                                                                  .name,
                                                              'Marque',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Avenir Next',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .rougeMalongo,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      FFAppConstants
                                                                          .spacing,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .repsnapModel6,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: RepsnapWidget(
                                                          content:
                                                              'Merci de partager ces précisions avec nous.',
                                                          isUserTalking: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .repsnapModel7,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: RepsnapWidget(
                                                          content: () {
                                                            if (widget.nps ==
                                                                10) {
                                                              return 'On aimerait partager ce qui fait que votre expérience est si bonne avec notre communauté. Est-ce que vous êtes d’accord pour nous le raconter en vidéo ?';
                                                            } else if (widget
                                                                    .nps! <=
                                                                6) {
                                                              return 'Nous améliorons nos services grâce aux retours de nos clients. Votre réponse à un questionnaire serait très utile.';
                                                            } else {
                                                              return 'Notre communauté grandit grâce aux avis en ligne. Aidez-nous à toucher plus de monde en partageant le vôtre !';
                                                            }
                                                          }(),
                                                          isUserTalking: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (!_model.saidNo &&
                                                    !_model.saidYes)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (widget
                                                                        .nps ==
                                                                    10) {
                                                                  unawaited(
                                                                    () async {
                                                                      await ExperiencesTable()
                                                                          .update(
                                                                        data: {
                                                                          'video_done':
                                                                              true,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          widget
                                                                              .xId,
                                                                        ),
                                                                      );
                                                                    }(),
                                                                  );
                                                                  _model.saidYes =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  await launchURL(
                                                                      'https://app.cogeus.com/home?slug=${chatClientsRow.slugHarvester}');
                                                                } else if (widget
                                                                        .nps! <=
                                                                    6) {
                                                                  await showDialog(
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                FeedbackWidget(
                                                                              q1: chatClientsRow.theme1!,
                                                                              q2: chatClientsRow.theme2!,
                                                                              q3: chatClientsRow.theme3!,
                                                                              q4: chatClientsRow.theme4!,
                                                                              xId: widget.xId!,
                                                                              clid: widget.clid!,
                                                                              nps: widget.nps!,
                                                                              autreRaison: '',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.saidYes =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                } else {
                                                                  unawaited(
                                                                    () async {
                                                                      await ExperiencesTable()
                                                                          .update(
                                                                        data: {
                                                                          'review_done':
                                                                              true,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          widget
                                                                              .xId,
                                                                        ),
                                                                      );
                                                                    }(),
                                                                  );
                                                                  _model.saidYes =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  await launchURL(
                                                                      chatClientsRow
                                                                          .reviewLink!);
                                                                }
                                                              },
                                                              child: Container(
                                                                height: 36.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: chatClientsRow.color !=
                                                                              null &&
                                                                          chatClientsRow.color !=
                                                                              ''
                                                                      ? colorFromCssString(
                                                                          chatClientsRow
                                                                              .color!,
                                                                          defaultColor:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                        )
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        () {
                                                                          if (widget.nps ==
                                                                              10) {
                                                                            return 'J\'enregistre une vidéo';
                                                                          } else if (widget.nps! <=
                                                                              6) {
                                                                            return 'Je réponds';
                                                                          } else {
                                                                            return 'Je poste un avis';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: 'Avenir Next',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: FFAppConstants.spacing,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (widget.nps ==
                                                                  10) {
                                                                unawaited(
                                                                  () async {
                                                                    await ExperiencesTable()
                                                                        .update(
                                                                      data: {
                                                                        'video_done':
                                                                            false,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .xId,
                                                                      ),
                                                                    );
                                                                  }(),
                                                                );
                                                              } else if (widget
                                                                      .nps! <=
                                                                  6) {
                                                                unawaited(
                                                                  () async {
                                                                    await ExperiencesTable()
                                                                        .update(
                                                                      data: {
                                                                        'feedback_answer':
                                                                            false,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .xId,
                                                                      ),
                                                                    );
                                                                  }(),
                                                                );
                                                              } else {
                                                                unawaited(
                                                                  () async {
                                                                    await ExperiencesTable()
                                                                        .update(
                                                                      data: {
                                                                        'review_done':
                                                                            false,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .xId,
                                                                      ),
                                                                    );
                                                                  }(),
                                                                );
                                                              }

                                                              _model.saidNo =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              if (widget.nps! <
                                                                  7) {
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                _model.askEmail =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 36.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.85,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: chatClientsRow.color !=
                                                                              null &&
                                                                          chatClientsRow.color !=
                                                                              ''
                                                                      ? colorFromCssString(
                                                                          chatClientsRow
                                                                              .color!,
                                                                          defaultColor:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                        )
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Je refuse',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Avenir Next',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                FFAppConstants.spacing,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 6.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height:
                                                                        12.0)),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(SizedBox(height: 7.0)),
                                            );
                                          } else {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              chatClientsRow
                                                                  .name,
                                                              'Marque',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Avenir Next',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .rougeMalongo,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      FFAppConstants
                                                                          .spacing,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .repsnapModel8,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: RepsnapWidget(
                                                          content:
                                                              'Merci de partager ces précisions avec nous.',
                                                          isUserTalking: false,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .repsnapModel9,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: RepsnapWidget(
                                                          content: widget
                                                                      .nps! >=
                                                                  7
                                                              ? 'Notre communauté grandit grâce aux avis en ligne. Aidez-nous à toucher plus de monde en partageant le vôtre !'
                                                              : 'Nous améliorons nos services grâce aux retours de nos clients. Votre réponse à un questionnaire serait très appréciée.',
                                                          isUserTalking: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (!_model.saidNo &&
                                                    !_model.saidYes)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (widget
                                                                        .nps ==
                                                                    10) {
                                                                  unawaited(
                                                                    () async {
                                                                      await ExperiencesTable()
                                                                          .update(
                                                                        data: {
                                                                          'review_done':
                                                                              true,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          widget
                                                                              .xId,
                                                                        ),
                                                                      );
                                                                    }(),
                                                                  );
                                                                  await launchURL(
                                                                      chatClientsRow
                                                                          .reviewLink!);
                                                                } else if (widget
                                                                        .nps! <=
                                                                    6) {
                                                                  await showDialog(
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                FeedbackWidget(
                                                                              q1: chatClientsRow.theme1!,
                                                                              q2: chatClientsRow.theme2!,
                                                                              q3: chatClientsRow.theme3!,
                                                                              q4: chatClientsRow.theme4!,
                                                                              xId: widget.xId!,
                                                                              clid: widget.clid!,
                                                                              nps: widget.nps!,
                                                                              autreRaison: _model.feedback,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                } else {
                                                                  unawaited(
                                                                    () async {
                                                                      await ExperiencesTable()
                                                                          .update(
                                                                        data: {
                                                                          'review_done':
                                                                              true,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          widget
                                                                              .xId,
                                                                        ),
                                                                      );
                                                                    }(),
                                                                  );
                                                                  await launchURL(
                                                                      chatClientsRow
                                                                          .reviewLink!);
                                                                }

                                                                _model.saidYes =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                height: 36.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: chatClientsRow.color !=
                                                                              null &&
                                                                          chatClientsRow.color !=
                                                                              ''
                                                                      ? colorFromCssString(
                                                                          chatClientsRow
                                                                              .color!,
                                                                          defaultColor:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                        )
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        widget.nps! >=
                                                                                7
                                                                            ? 'Je poste un avis'
                                                                            : 'Je réponds',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: 'Avenir Next',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: FFAppConstants.spacing,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (widget.nps ==
                                                                  10) {
                                                                unawaited(
                                                                  () async {
                                                                    await ExperiencesTable()
                                                                        .update(
                                                                      data: {
                                                                        'review_done':
                                                                            false,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .xId,
                                                                      ),
                                                                    );
                                                                  }(),
                                                                );
                                                              } else if (widget
                                                                      .nps! <=
                                                                  6) {
                                                                unawaited(
                                                                  () async {
                                                                    await ExperiencesTable()
                                                                        .update(
                                                                      data: {
                                                                        'feedback_answer':
                                                                            false,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .xId,
                                                                      ),
                                                                    );
                                                                  }(),
                                                                );
                                                              } else {
                                                                unawaited(
                                                                  () async {
                                                                    await ExperiencesTable()
                                                                        .update(
                                                                      data: {
                                                                        'review_done':
                                                                            false,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .xId,
                                                                      ),
                                                                    );
                                                                  }(),
                                                                );
                                                              }

                                                              _model.saidNo =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              if (widget.nps! <
                                                                  7) {
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                                _model.askEmail =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 36.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.85,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: chatClientsRow.color !=
                                                                              null &&
                                                                          chatClientsRow.color !=
                                                                              ''
                                                                      ? colorFromCssString(
                                                                          chatClientsRow
                                                                              .color!,
                                                                          defaultColor:
                                                                              FlutterFlowTheme.of(context).accent4,
                                                                        )
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent4,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Je refuse',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Avenir Next',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                FFAppConstants.spacing,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 6.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height:
                                                                        12.0)),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(SizedBox(height: 7.0)),
                                            );
                                          }
                                        },
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'conditionalBuilderOnActionTriggerAnimation']!,
                                      ),
                                      if (_model.saidNo || _model.saidYes)
                                        Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      'Moi',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Avenir Next',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    FFAppConstants
                                                                        .spacing,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              wrapWithModel(
                                                model: _model.repsnapModel10,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RepsnapWidget(
                                                  content: _model.saidNo
                                                      ? 'Je refuse'
                                                      : () {
                                                          if (((widget.nps! >=
                                                                      7) &&
                                                                  (widget.nps !=
                                                                      10)) &&
                                                              (chatClientsRow
                                                                          .slugHarvester ==
                                                                      null ||
                                                                  chatClientsRow
                                                                          .slugHarvester ==
                                                                      '')) {
                                                            return 'Je poste un avis';
                                                          } else if ((widget
                                                                      .nps ==
                                                                  10) &&
                                                              (chatClientsRow
                                                                          .slugHarvester !=
                                                                      null &&
                                                                  chatClientsRow
                                                                          .slugHarvester !=
                                                                      '')) {
                                                            return 'J\'enregistre une vidéo';
                                                          } else if (widget
                                                                  .nps! <=
                                                              6) {
                                                            return 'Je réponds';
                                                          } else {
                                                            return 'Je poste un avis';
                                                          }
                                                        }(),
                                                  isUserTalking: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if ((_model.saidNo &&
                                              (widget.nps! > 6)) ||
                                          (_model.saidYes &&
                                              (widget.nps! > 6)))
                                        Builder(
                                          builder: (context) {
                                            if (chatClientsRow.slugHarvester !=
                                                    null &&
                                                chatClientsRow.slugHarvester !=
                                                    '') {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                chatClientsRow
                                                                    .name,
                                                                'Marque',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Avenir Next',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .rougeMalongo,
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        FFAppConstants
                                                                            .spacing,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .repsnapModel11,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: RepsnapWidget(
                                                            content: _model
                                                                    .saidNo
                                                                ? 'Pas de problème, on comprend tout à fait.'
                                                                : 'Merci de votre participation !',
                                                            isUserTalking:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .repsnapModel12,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: RepsnapWidget(
                                                            content: widget
                                                                        .nps ==
                                                                    10
                                                                ? 'Notre communauté grandit grâce aux avis en ligne. Aidez-nous à toucher plus de monde en partageant le vôtre !'
                                                                : 'Nous améliorons nos services grâce aux retours de nos clients. Votre réponse à un questionnaire serait très appréciée.',
                                                            isUserTalking:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (!_model.saidNoTwice &&
                                                      !_model.saidYesTwice)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (widget
                                                                          .nps ==
                                                                      10) {
                                                                    unawaited(
                                                                      () async {
                                                                        await ExperiencesTable()
                                                                            .update(
                                                                          data: {
                                                                            'review_done':
                                                                                true,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'id',
                                                                            widget.xId,
                                                                          ),
                                                                        );
                                                                      }(),
                                                                    );
                                                                    await launchURL(
                                                                        chatClientsRow
                                                                            .reviewLink!);
                                                                    _model.saidYes =
                                                                        true;
                                                                    _model.saidYesTwice =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    await showDialog(
                                                                      barrierColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      barrierDismissible:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: FeedbackWidget(
                                                                                q1: chatClientsRow.theme1!,
                                                                                q2: chatClientsRow.theme2!,
                                                                                q3: chatClientsRow.theme3!,
                                                                                q4: chatClientsRow.theme4!,
                                                                                xId: widget.xId!,
                                                                                clid: widget.clid!,
                                                                                nps: widget.nps!,
                                                                                autreRaison: _model.feedback,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    _model.saidYes =
                                                                        true;
                                                                    _model.saidYesTwice =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation'] !=
                                                                        null) {
                                                                      await animationsMap[
                                                                              'containerOnActionTriggerAnimation']!
                                                                          .controller
                                                                          .forward(
                                                                              from: 0.0);
                                                                    }
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 36.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.85,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: chatClientsRow.color !=
                                                                                null &&
                                                                            chatClientsRow.color !=
                                                                                ''
                                                                        ? colorFromCssString(
                                                                            chatClientsRow.color!,
                                                                            defaultColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                          )
                                                                        : FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          widget.nps == 10
                                                                              ? 'Je poste un avis'
                                                                              : 'Je réponds',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                fontFamily: 'Avenir Next',
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: FFAppConstants.spacing,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (widget
                                                                        .nps ==
                                                                    10) {
                                                                  unawaited(
                                                                    () async {
                                                                      await ExperiencesTable()
                                                                          .update(
                                                                        data: {
                                                                          'review_done':
                                                                              false,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          widget
                                                                              .xId,
                                                                        ),
                                                                      );
                                                                    }(),
                                                                  );
                                                                } else {
                                                                  unawaited(
                                                                    () async {
                                                                      await ExperiencesTable()
                                                                          .update(
                                                                        data: {
                                                                          'feedback_answer':
                                                                              false,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'id',
                                                                          widget
                                                                              .xId,
                                                                        ),
                                                                      );
                                                                    }(),
                                                                  );
                                                                }

                                                                _model.saidNoTwice =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                if (widget
                                                                        .nps! <
                                                                    9) {
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                }
                                                              },
                                                              child: Container(
                                                                height: 36.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: chatClientsRow.color !=
                                                                                null &&
                                                                            chatClientsRow.color !=
                                                                                ''
                                                                        ? colorFromCssString(
                                                                            chatClientsRow.color!,
                                                                            defaultColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                          )
                                                                        : FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Je refuse',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: 'Avenir Next',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: FFAppConstants.spacing,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 6.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          12.0)),
                                                        ),
                                                      ],
                                                    ),
                                                ].divide(SizedBox(height: 7.0)),
                                              );
                                            } else {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                chatClientsRow
                                                                    .name,
                                                                'Marque',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Avenir Next',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .rougeMalongo,
                                                                    fontSize:
                                                                        22.0,
                                                                    letterSpacing:
                                                                        FFAppConstants
                                                                            .spacing,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .repsnapModel13,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: RepsnapWidget(
                                                            content: _model
                                                                    .saidNo
                                                                ? 'Pas de problème, on comprend tout à fait.'
                                                                : 'Merci de votre participation !',
                                                            isUserTalking:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .repsnapModel14,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: RepsnapWidget(
                                                            content:
                                                                'Nous améliorons nos services grâce aux retours de nos clients. Votre réponse à un questionnaire serait très appréciée.',
                                                            isUserTalking:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (!_model.saidNoTwice &&
                                                      !_model.saidYesTwice)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await showDialog(
                                                                    barrierColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                FeedbackWidget(
                                                                              q1: chatClientsRow.theme1!,
                                                                              q2: chatClientsRow.theme2!,
                                                                              q3: chatClientsRow.theme3!,
                                                                              q4: chatClientsRow.theme4!,
                                                                              xId: widget.xId!,
                                                                              clid: widget.clid!,
                                                                              nps: widget.nps!,
                                                                              autreRaison: _model.feedback,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.saidYes =
                                                                      true;
                                                                  _model.saidYesTwice =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (animationsMap[
                                                                          'containerOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'containerOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 36.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.85,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: chatClientsRow.color !=
                                                                                null &&
                                                                            chatClientsRow.color !=
                                                                                ''
                                                                        ? colorFromCssString(
                                                                            chatClientsRow.color!,
                                                                            defaultColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                          )
                                                                        : FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Je réponds',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                fontFamily: 'Avenir Next',
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: FFAppConstants.spacing,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                unawaited(
                                                                  () async {
                                                                    await ExperiencesTable()
                                                                        .update(
                                                                      data: {
                                                                        'feedback_answer':
                                                                            false,
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eqOrNull(
                                                                        'id',
                                                                        widget
                                                                            .xId,
                                                                      ),
                                                                    );
                                                                  }(),
                                                                );
                                                                _model.saidNoTwice =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0);
                                                                }
                                                              },
                                                              child: Container(
                                                                height: 36.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.85,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: chatClientsRow.color !=
                                                                                null &&
                                                                            chatClientsRow.color !=
                                                                                ''
                                                                        ? colorFromCssString(
                                                                            chatClientsRow.color!,
                                                                            defaultColor:
                                                                                FlutterFlowTheme.of(context).accent4,
                                                                          )
                                                                        : FlutterFlowTheme.of(context)
                                                                            .accent4,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Je refuse',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: 'Avenir Next',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: FFAppConstants.spacing,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 6.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          12.0)),
                                                        ),
                                                      ],
                                                    ),
                                                ].divide(SizedBox(height: 7.0)),
                                              );
                                            }
                                          },
                                        ),
                                      if (_model.saidNoTwice ||
                                          (_model.saidNo && _model.saidYes))
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      'Moi',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Avenir Next',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    FFAppConstants
                                                                        .spacing,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              wrapWithModel(
                                                model: _model.repsnapModel15,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RepsnapWidget(
                                                  content: _model.saidNoTwice
                                                      ? 'Je refuse'
                                                      : ((widget.nps == 10) &&
                                                              (chatClientsRow
                                                                          .slugHarvester !=
                                                                      null &&
                                                                  chatClientsRow
                                                                          .slugHarvester !=
                                                                      '')
                                                          ? 'Je poste un avis'
                                                          : 'Je réponds'),
                                                  isUserTalking: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (((widget.nps == 10) &&
                                              _model.saidNoTwice &&
                                              (chatClientsRow.slugHarvester !=
                                                      null &&
                                                  chatClientsRow
                                                          .slugHarvester !=
                                                      '')) ||
                                          ((widget.nps == 10) &&
                                              _model.saidYesTwice &&
                                              (chatClientsRow.slugHarvester !=
                                                      null &&
                                                  chatClientsRow
                                                          .slugHarvester !=
                                                      '')))
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          chatClientsRow.name,
                                                          'Marque',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Avenir Next',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .rougeMalongo,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      FFAppConstants
                                                                          .spacing,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.repsnapModel16,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: RepsnapWidget(
                                                      content:
                                                          'Nous améliorons nos services grâce aux retours de nos clients. Votre réponse à un questionnaire serait très appréciée.',
                                                      isUserTalking: false,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (!_model.saidNoTrice &&
                                                !_model.saidYesTrice)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showDialog(
                                                              barrierColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              barrierDismissible:
                                                                  false,
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          FeedbackWidget(
                                                                        q1: chatClientsRow
                                                                            .theme1!,
                                                                        q2: chatClientsRow
                                                                            .theme2!,
                                                                        q3: chatClientsRow
                                                                            .theme3!,
                                                                        q4: chatClientsRow
                                                                            .theme4!,
                                                                        xId: widget
                                                                            .xId!,
                                                                        clid: widget
                                                                            .clid!,
                                                                        nps: widget
                                                                            .nps!,
                                                                        autreRaison:
                                                                            _model.feedback,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            _model.saidYesTrice =
                                                                true;
                                                            safeSetState(() {});
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation'] !=
                                                                null) {
                                                              await animationsMap[
                                                                      'containerOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0);
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 36.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.85,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: chatClientsRow
                                                                              .color !=
                                                                          null &&
                                                                      chatClientsRow
                                                                              .color !=
                                                                          ''
                                                                  ? colorFromCssString(
                                                                      chatClientsRow
                                                                          .color!,
                                                                      defaultColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .accent4,
                                                                    )
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Je réponds',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Avenir Next',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              FFAppConstants.spacing,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          unawaited(
                                                            () async {
                                                              await ExperiencesTable()
                                                                  .update(
                                                                data: {
                                                                  'feedback_answer':
                                                                      false,
                                                                },
                                                                matchingRows:
                                                                    (rows) => rows
                                                                        .eqOrNull(
                                                                  'id',
                                                                  widget.xId,
                                                                ),
                                                              );
                                                            }(),
                                                          );
                                                          _model.saidNoTrice =
                                                              true;
                                                          safeSetState(() {});
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 36.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.85,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: chatClientsRow
                                                                              .color !=
                                                                          null &&
                                                                      chatClientsRow
                                                                              .color !=
                                                                          ''
                                                                  ? colorFromCssString(
                                                                      chatClientsRow
                                                                          .color!,
                                                                      defaultColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .accent4,
                                                                    )
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Je refuse',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Avenir Next',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            FFAppConstants.spacing,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 6.0))
                                                        .addToStart(SizedBox(
                                                            height: 12.0)),
                                                  ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 7.0)),
                                        ),
                                      if (_model.saidNoTrice ||
                                          (_model.saidNo &&
                                              _model.saidYes &&
                                              _model.saidNoTwice))
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      'Moi',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Avenir Next',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    FFAppConstants
                                                                        .spacing,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              wrapWithModel(
                                                model: _model.repsnapModel17,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: RepsnapWidget(
                                                  content: _model.saidNoTrice
                                                      ? 'Je refuse'
                                                      : 'Je réponds',
                                                  isUserTalking: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      chatClientsRow.name,
                                                      'Marque',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Avenir Next',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .rougeMalongo,
                                                          fontSize: 22.0,
                                                          letterSpacing:
                                                              FFAppConstants
                                                                  .spacing,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            wrapWithModel(
                                              model: _model.repsnapModel18,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: RepsnapWidget(
                                                content:
                                                    'Merci de votre participation !',
                                                isUserTalking: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation']!,
                                      ),
                                    ].divide(SizedBox(height: 7.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_model.showchat)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 2000),
                                    () => safeSetState(() {}),
                                  ),
                                  onFieldSubmitted: (_) async {
                                    await ExperiencesTable().update(
                                      data: {
                                        'feedback': _model.textController.text,
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        widget.xId,
                                      ),
                                    );
                                    _model.feedback =
                                        _model.textController.text;
                                    _model.themeComplete = true;
                                    _model.showThemeChoiceChat = true;
                                    _model.showchat = false;
                                    _model.showAutre = true;
                                    _model.autreExpressed =
                                        _model.textController.text;
                                    safeSetState(() {});
                                    if (animationsMap[
                                            'conditionalBuilderOnActionTriggerAnimation'] !=
                                        null) {
                                      await animationsMap[
                                              'conditionalBuilderOnActionTriggerAnimation']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                    safeSetState(() {
                                      _model.textController?.clear();
                                    });
                                  },
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Ecrivez ici',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    suffixIcon: _model
                                            .textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              size: 18.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
