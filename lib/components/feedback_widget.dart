import '/backend/supabase/supabase.dart';
import '/components/form_detractor_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feedback_model.dart';
export 'feedback_model.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({
    super.key,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.xId,
    required this.clid,
    required this.nps,
    this.autreRaison,
  });

  final String? q1;
  final String? q2;
  final String? q3;
  final String? q4;
  final int? xId;
  final int? clid;
  final int? nps;
  final String? autreRaison;

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  late FeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackModel());

    _model.messageTextController ??=
        TextEditingController(text: widget.autreRaison);
    _model.messageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
              child: Container(
                width: 300.0,
                height: MediaQuery.sizeOf(context).height * 0.95,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Votre Feedback',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Avenir Next',
                              fontSize: 24.0,
                              letterSpacing: FFAppConstants.spacing,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 73.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Avis général',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16.0,
                                          letterSpacing: FFAppConstants.spacing,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() => _model
                                                .ratingBarValue1 = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating:
                                            _model.ratingBarValue1 ??= 0.0,
                                        unratedColor: Color(0x671C4494),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        glowColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Text(
                                        () {
                                          if (_model.ratingBarValue1 == 1.0) {
                                            return 'Très insatisfait';
                                          } else if (_model.ratingBarValue1 ==
                                              2.0) {
                                            return 'Insatisfait';
                                          } else if (_model.ratingBarValue1 ==
                                              3.0) {
                                            return 'Neutre';
                                          } else if (_model.ratingBarValue1 ==
                                              4.0) {
                                            return 'Satisfait';
                                          } else if (_model.ratingBarValue1 ==
                                              5.0) {
                                            return 'Très satisfait';
                                          } else {
                                            return '';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 73.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.q1,
                                      'Sujet 1',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16.0,
                                          letterSpacing: FFAppConstants.spacing,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() => _model
                                                .ratingBarValue2 = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating:
                                            _model.ratingBarValue2 ??= 0.0,
                                        unratedColor: Color(0x671C4494),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        glowColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Text(
                                        () {
                                          if (_model.ratingBarValue2 == 1.0) {
                                            return 'Très insatisfait';
                                          } else if (_model.ratingBarValue2 ==
                                              2.0) {
                                            return 'Insatisfait';
                                          } else if (_model.ratingBarValue2 ==
                                              3.0) {
                                            return 'Neutre';
                                          } else if (_model.ratingBarValue2 ==
                                              4.0) {
                                            return 'Satisfait';
                                          } else if (_model.ratingBarValue2 ==
                                              5.0) {
                                            return 'Très satisfait';
                                          } else {
                                            return '';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 73.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.q2,
                                      'Sujet 2',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16.0,
                                          letterSpacing: FFAppConstants.spacing,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() => _model
                                                .ratingBarValue3 = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating:
                                            _model.ratingBarValue3 ??= 0.0,
                                        unratedColor: Color(0x671C4494),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        glowColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Text(
                                        () {
                                          if (_model.ratingBarValue3 == 1.0) {
                                            return 'Très insatisfait';
                                          } else if (_model.ratingBarValue3 ==
                                              2.0) {
                                            return 'Insatisfait';
                                          } else if (_model.ratingBarValue3 ==
                                              3.0) {
                                            return 'Neutre';
                                          } else if (_model.ratingBarValue3 ==
                                              4.0) {
                                            return 'Satisfait';
                                          } else if (_model.ratingBarValue3 ==
                                              5.0) {
                                            return 'Très satisfait';
                                          } else {
                                            return '';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 73.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.q3,
                                      'Sujet 3',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16.0,
                                          letterSpacing: FFAppConstants.spacing,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() => _model
                                                .ratingBarValue4 = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating:
                                            _model.ratingBarValue4 ??= 0.0,
                                        unratedColor: Color(0x671C4494),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        glowColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Text(
                                        () {
                                          if (_model.ratingBarValue4 == 1.0) {
                                            return 'Très insatisfait';
                                          } else if (_model.ratingBarValue4 ==
                                              2.0) {
                                            return 'Insatisfait';
                                          } else if (_model.ratingBarValue4 ==
                                              3.0) {
                                            return 'Neutre';
                                          } else if (_model.ratingBarValue4 ==
                                              4.0) {
                                            return 'Satisfait';
                                          } else if (_model.ratingBarValue4 ==
                                              5.0) {
                                            return 'Très satisfait';
                                          } else {
                                            return '';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 73.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.q4,
                                      'Sujet 4',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16.0,
                                          letterSpacing: FFAppConstants.spacing,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() => _model
                                                .ratingBarValue5 = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating:
                                            _model.ratingBarValue5 ??= 0.0,
                                        unratedColor: Color(0x671C4494),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        glowColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      Text(
                                        () {
                                          if (_model.ratingBarValue5 == 1.0) {
                                            return 'Très insatisfait';
                                          } else if (_model.ratingBarValue5 ==
                                              2.0) {
                                            return 'Insatisfait';
                                          } else if (_model.ratingBarValue5 ==
                                              3.0) {
                                            return 'Neutre';
                                          } else if (_model.ratingBarValue5 ==
                                              4.0) {
                                            return 'Satisfait';
                                          } else if (_model.ratingBarValue5 ==
                                              5.0) {
                                            return 'Très satisfait';
                                          } else {
                                            return '';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 140.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Quelque chose à ajouter ? (Optionnel)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Avenir Next',
                                          fontSize: 16.0,
                                          letterSpacing: FFAppConstants.spacing,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  TextFormField(
                                    controller: _model.messageTextController,
                                    focusNode: _model.messageFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .revoSearchBarBg,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    maxLines: 5,
                                    minLines: 3,
                                    validator: _model
                                        .messageTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 100.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await ExperiencesTable().update(
                                    data: {
                                      'feedback_general':
                                          _model.ratingBarValue1?.round(),
                                      'feedback_1':
                                          _model.ratingBarValue2?.round(),
                                      'feedback_2':
                                          _model.ratingBarValue3?.round(),
                                      'feedback_3':
                                          _model.ratingBarValue4?.round(),
                                      'feedback_4':
                                          _model.ratingBarValue5?.round(),
                                      'feedback_answer': true,
                                      'feedback_customText':
                                          _model.messageTextController.text,
                                      'wantsContact': true,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id',
                                      FFAppState().expId,
                                    ),
                                  );
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: FormDetractorWidget(
                                            xId: widget.xId!,
                                            clid: widget.clid!,
                                            nps: widget.nps!,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 36.0,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent4,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'J\'aimerais être recontacté',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Avenir Next',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 6.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await ExperiencesTable().update(
                                  data: {
                                    'feedback_general':
                                        _model.ratingBarValue1?.round(),
                                    'feedback_1':
                                        _model.ratingBarValue2?.round(),
                                    'feedback_2':
                                        _model.ratingBarValue3?.round(),
                                    'feedback_3':
                                        _model.ratingBarValue4?.round(),
                                    'feedback_4':
                                        _model.ratingBarValue5?.round(),
                                    'feedback_answer': true,
                                    'feedback_customText':
                                        _model.messageTextController.text,
                                    'wantsContact': false,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    FFAppState().expId,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              child: Text(
                                'J’envoie anonymement mon feedback',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Avenir Next',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
