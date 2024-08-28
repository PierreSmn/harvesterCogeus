import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'infos_model.dart';
export 'infos_model.dart';

class InfosWidget extends StatefulWidget {
  const InfosWidget({super.key});

  @override
  State<InfosWidget> createState() => _InfosWidgetState();
}

class _InfosWidgetState extends State<InfosWidget>
    with TickerProviderStateMixin {
  late InfosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasCheckboxTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfosModel());

    _model.nameTextController ??=
        TextEditingController(text: FFAppState().name);
    _model.nameFocusNode ??= FocusNode();

    _model.emailTextController ??=
        TextEditingController(text: FFAppState().email);
    _model.emailFocusNode ??= FocusNode();

    animationsMap.addAll({
      'ratingBarOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 720.0.ms,
            begin: const Offset(0.7, 0.7),
            end: const Offset(1.1, 1.1),
          ),
        ],
      ),
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        final infosGetSupaResponse = snapshot.data!;

        return Title(
            title: 'infos',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((_model.step == 1) &&
                            (GetSupaCall.mailOnlyBool(
                                  infosGetSupaResponse.jsonBody,
                                ) ==
                                false))
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 400.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              buttonSize: 44.0,
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .revoCardTextColorUnselected,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                context.pop();
                                              },
                                            ),
                                            Text(
                                              'Retour',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColorUnselected,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Prénom',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .revoCardTextColor,
                                                          fontSize: 38.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Nous avons besoin de votre prénom pour que l\'inscription soit validée.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .revoCardTextColorUnselected,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .revoSearchBarBg,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Form(
                                            key: _model.formKey1,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                0.0, 5.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .nameTextController,
                                                      focusNode:
                                                          _model.nameFocusNode,
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Prénom',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .revoSearchIconColor,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      maxLines: null,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      validator: _model
                                                          .nameTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey1
                                                          .currentState ==
                                                      null ||
                                                  !_model.formKey1.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              FFAppState().name = _model
                                                  .nameTextController.text;
                                              if (!(FFAppState().name != '')) {
                                                return;
                                              }
                                              _model.step = _model.step! + 1;
                                              setState(() {});
                                            },
                                            text: 'Continuer',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: colorFromCssString(
                                                GetSupaCall.colorButton(
                                                  infosGetSupaResponse.jsonBody,
                                                )!,
                                                defaultColor:
                                                    FlutterFlowTheme.of(context)
                                                        .appleButton,
                                              ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall
                                                              .colorButtonText(
                                                            infosGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 36.0)),
                            ),
                          ),
                        if (_model.step == 2)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 400.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 32.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 44.0,
                                            icon: Icon(
                                              Icons.arrow_back_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .revoCardTextColorUnselected,
                                              size: 22.0,
                                            ),
                                            onPressed: () async {
                                              _model.step = _model.step! + -1;
                                              setState(() {});
                                            },
                                          ),
                                          Text(
                                            'Retour',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .revoCardTextColorUnselected,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Note',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColor,
                                                        fontSize: 38.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      const TextSpan(
                                                        text:
                                                            'Quelle note globale donneriez-vous à ',
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text: GetSupaCall.brand(
                                                          infosGetSupaResponse
                                                              .jsonBody,
                                                        )!,
                                                        style: const TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .revoSearchTxtColor,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .revoSearchBarBg,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RatingBar.builder(
                                              onRatingUpdate: (newValue) =>
                                                  setState(() =>
                                                      _model.ratingBarValue =
                                                          newValue),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.stars_rounded,
                                                color: colorFromCssString(
                                                  GetSupaCall.colorButton(
                                                    infosGetSupaResponse
                                                        .jsonBody,
                                                  )!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              ),
                                              direction: Axis.horizontal,
                                              initialRating:
                                                  _model.ratingBarValue ??= 0.0,
                                              unratedColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              itemCount: 5,
                                              itemSize: 40.0,
                                              glowColor: colorFromCssString(
                                                GetSupaCall.colorButton(
                                                  infosGetSupaResponse.jsonBody,
                                                )!,
                                                defaultColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'ratingBarOnActionTriggerAnimation']!,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 24.0)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.ratingBarValue == 0.0) {
                                            if (animationsMap[
                                                    'ratingBarOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'ratingBarOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            return;
                                          }
                                          FFAppState().rating =
                                              _model.ratingBarValue!;
                                          if (!(FFAppState().rating != null)) {
                                            return;
                                          }
                                          _model.step = _model.step! + 1;
                                          setState(() {});
                                        },
                                        text: 'Continuer',
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: colorFromCssString(
                                            GetSupaCall.colorButton(
                                              infosGetSupaResponse.jsonBody,
                                            )!,
                                            defaultColor:
                                                FlutterFlowTheme.of(context)
                                                    .appleButton,
                                          ),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Manrope',
                                                color: colorFromCssString(
                                                  GetSupaCall.colorButtonText(
                                                    infosGetSupaResponse
                                                        .jsonBody,
                                                  )!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 36.0)),
                          ),
                        if ((_model.step == 3) ||
                            (GetSupaCall.mailOnlyBool(
                                  infosGetSupaResponse.jsonBody,
                                ) ==
                                true))
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 400.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              buttonSize: 44.0,
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                color: FlutterFlowTheme.of(
                                                        context)
                                                    .revoCardTextColorUnselected,
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                _model.step = _model.step! + -1;
                                                setState(() {});
                                              },
                                            ),
                                            Text(
                                              'Retour',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .revoCardTextColorUnselected,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Email',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .revoCardTextColor,
                                                          fontSize: 38.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Votre email nous permettra de vous récompenser.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .revoCardTextColorUnselected,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .revoSearchBarBg,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Form(
                                            key: _model.formKey2,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 5.0,
                                                                0.0, 5.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailTextController,
                                                      focusNode:
                                                          _model.emailFocusNode,
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .none,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'john@mail.com',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .revoSearchIconColor,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      maxLines: null,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .emailTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
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
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .appleTxt1,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                      .checkboxValue ??= false,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.checkboxValue =
                                                            newValue!);
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .appleTxt1,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  checkColor: GetSupaCall
                                                                  .colorButton(
                                                                infosGetSupaResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          GetSupaCall
                                                                  .colorButton(
                                                                infosGetSupaResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              ''
                                                      ? colorFromCssString(
                                                          GetSupaCall
                                                              .colorButton(
                                                            infosGetSupaResponse
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
                                                    const TextSpan(
                                                      text:
                                                          'Vous acceptez de partager vos informations avec ',
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: FFAppState()
                                                          .brandName,
                                                      style: const TextStyle(),
                                                    ),
                                                    const TextSpan(
                                                      text:
                                                          ' (communication, promotion, informations pratiques)',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!FFAppState().validatedDone)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var shouldSetState = false;
                                              FFAppState().email = _model
                                                  .emailTextController.text;
                                              FFAppState().update(() {});
                                              if (GetSupaCall.mailOnlyBool(
                                                    infosGetSupaResponse
                                                        .jsonBody,
                                                  ) ==
                                                  true) {
                                                FFAppState().name = 'mailOnly';
                                                FFAppState().rating = 6.0;
                                                setState(() {});
                                              }
                                              if (!((FFAppState().name !=
                                                          '') &&
                                                  (FFAppState().email !=
                                                          '') &&
                                                  (FFAppState().videoUrl !=
                                                          '') &&
                                                  (FFAppState().slug !=
                                                          '') &&
                                                  (FFAppState().brandName !=
                                                          '') &&
                                                  (FFAppState().rating !=
                                                      null) &&
                                                  (FFAppState()
                                                              .questionAsked !=
                                                          ''))) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: const Text(
                                                            'soehting aint right'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }
                                              _model.apiResultro6 =
                                                  await PostSubmissionFgCall
                                                      .call(
                                                name: valueOrDefault<String>(
                                                  FFAppState().name,
                                                  'emailOnly',
                                                ),
                                                email: FFAppState().email,
                                                video: FFAppState().videoUrl,
                                                slug: FFAppState().slug,
                                                brand: FFAppState().brandName,
                                                boolmail: _model.checkboxValue!
                                                    ? true
                                                    : false,
                                                question: 'notWorking',
                                                rating: valueOrDefault<double>(
                                                  FFAppState().rating,
                                                  6.0,
                                                ),
                                                time: getCurrentTimestamp
                                                    .toString(),
                                              );

                                              shouldSetState = true;
                                              if ((_model.apiResultro6
                                                      ?.succeeded ??
                                                  true)) {
                                                FFAppState().validatedDone =
                                                    true;
                                                setState(() {});

                                                context.pushNamed('done');
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      (_model.apiResultro6
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            text: 'Continuer',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: colorFromCssString(
                                                GetSupaCall.colorButton(
                                                  infosGetSupaResponse.jsonBody,
                                                )!,
                                                defaultColor:
                                                    FlutterFlowTheme.of(context)
                                                        .appleButton,
                                              ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall
                                                              .colorButtonText(
                                                            infosGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
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
                                        ),
                                      if (FFAppState().validatedDone)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed('done');
                                            },
                                            text: 'Voir ma récompense',
                                            options: FFButtonOptions(
                                              width: 300.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: colorFromCssString(
                                                GetSupaCall.colorButton(
                                                  infosGetSupaResponse.jsonBody,
                                                )!,
                                                defaultColor:
                                                    FlutterFlowTheme.of(context)
                                                        .appleButton,
                                              ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall
                                                              .colorButtonText(
                                                            infosGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                        ),
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
                                        ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(height: 36.0)),
                            ),
                          ),
                      ].addToStart(const SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
