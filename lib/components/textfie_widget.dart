import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'textfie_model.dart';
export 'textfie_model.dart';

class TextfieWidget extends StatefulWidget {
  const TextfieWidget({
    super.key,
    required this.content,
  });

  final String? content;

  @override
  State<TextfieWidget> createState() => _TextfieWidgetState();
}

class _TextfieWidgetState extends State<TextfieWidget> {
  late TextfieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextfieModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        widget.content,
        'helloworld',
      ),
      maxLines: 1,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.manrope(
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            lineHeight: 0.0,
          ),
    );
  }
}
