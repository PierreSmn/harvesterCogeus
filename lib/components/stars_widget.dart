import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'stars_model.dart';
export 'stars_model.dart';

class StarsWidget extends StatefulWidget {
  const StarsWidget({super.key});

  @override
  State<StarsWidget> createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  late StarsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StarsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.grade = 1;
            safeSetState(() {});
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.grade! <= 1)
                Icon(
                  Icons.circle_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              if (_model.grade == null)
                Icon(
                  Icons.circle_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.grade = 2;
            safeSetState(() {});
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.grade! <= 2)
                Icon(
                  Icons.circle_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              if (_model.grade! <= 1)
                Icon(
                  Icons.circle_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.grade = 3;
            safeSetState(() {});
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.grade! <= 3)
                Icon(
                  Icons.circle_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              if (_model.grade! <= 2)
                Icon(
                  Icons.circle_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.grade = 4;
            safeSetState(() {});
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.grade! <= 4)
                Icon(
                  Icons.circle_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              if (_model.grade! <= 3)
                Icon(
                  Icons.circle_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            _model.grade = 5;
            safeSetState(() {});
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.grade! <= 5)
                Icon(
                  Icons.circle_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              if (_model.grade! <= 4)
                Icon(
                  Icons.circle_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
            ],
          ),
        ),
        Text(
          'Hello World',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Manrope',
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
