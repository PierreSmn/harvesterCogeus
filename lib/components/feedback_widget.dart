import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'feedback_model.dart';
export 'feedback_model.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({
    super.key,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
  });

  final String? q1;
  final String? q2;
  final String? q3;
  final String? q4;

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

    _model.messageTextController ??= TextEditingController();
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 300.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Votre Feedback',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Avenir Next',
                          fontSize: 24.0,
                          letterSpacing: FFAppConstants.spacing,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 73.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (newValue) => safeSetState(
                                        () =>
                                            _model.ratingBarValue1 = newValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue1 ??=
                                        0.0,
                                    unratedColor: const Color(0x671C4494),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    glowColor:
                                        FlutterFlowTheme.of(context).accent4,
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
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 6.0)),
                              ),
                            ].divide(const SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 73.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (newValue) => safeSetState(
                                        () =>
                                            _model.ratingBarValue2 = newValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue2 ??=
                                        0.0,
                                    unratedColor: const Color(0x671C4494),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    glowColor:
                                        FlutterFlowTheme.of(context).accent4,
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
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 6.0)),
                              ),
                            ].divide(const SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 73.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (newValue) => safeSetState(
                                        () =>
                                            _model.ratingBarValue3 = newValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue3 ??=
                                        0.0,
                                    unratedColor: const Color(0x671C4494),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    glowColor:
                                        FlutterFlowTheme.of(context).accent4,
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
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 6.0)),
                              ),
                            ].divide(const SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 73.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (newValue) => safeSetState(
                                        () =>
                                            _model.ratingBarValue4 = newValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue4 ??=
                                        0.0,
                                    unratedColor: const Color(0x671C4494),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    glowColor:
                                        FlutterFlowTheme.of(context).accent4,
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
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 6.0)),
                              ),
                            ].divide(const SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 73.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBar.builder(
                                    onRatingUpdate: (newValue) => safeSetState(
                                        () =>
                                            _model.ratingBarValue5 = newValue),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    direction: Axis.horizontal,
                                    initialRating: _model.ratingBarValue5 ??=
                                        0.0,
                                    unratedColor: const Color(0x671C4494),
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    glowColor:
                                        FlutterFlowTheme.of(context).accent4,
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
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 6.0)),
                              ),
                            ].divide(const SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 140.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
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
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .revoSearchBarBg,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: 5,
                                minLines: 3,
                                validator: _model.messageTextControllerValidator
                                    .asValidator(context),
                              ),
                            ].divide(const SizedBox(height: 4.0)),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 16.0)),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await ExperiencesTable().update(
                        data: {
                          'feedback_general': _model.ratingBarValue1?.round(),
                          'feedback_1': _model.ratingBarValue2?.round(),
                          'feedback_2': _model.ratingBarValue3?.round(),
                          'feedback_3': _model.ratingBarValue4?.round(),
                          'feedback_4': _model.ratingBarValue5?.round(),
                          'feedback_answer': true,
                          'feedback_customText':
                              _model.messageTextController.text,
                        },
                        matchingRows: (rows) => rows.eq(
                          'id',
                          FFAppState().expId,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    text: 'Envoyer',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).appleButton,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Manrope',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
