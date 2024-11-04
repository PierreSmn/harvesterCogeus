import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'avis_view_model.dart';
export 'avis_view_model.dart';

class AvisViewWidget extends StatefulWidget {
  const AvisViewWidget({super.key});

  @override
  State<AvisViewWidget> createState() => _AvisViewWidgetState();
}

class _AvisViewWidgetState extends State<AvisViewWidget> {
  late AvisViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvisViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowWebView(
      content:
          'https://search.google.com/local/writereview?placeid=ChIJgWdK7eZv5kcRV7K408t5-Ec',
      bypass: false,
      width: MediaQuery.sizeOf(context).width * 3.0,
      height: MediaQuery.sizeOf(context).height * 3.0,
      verticalScroll: false,
      horizontalScroll: false,
    );
  }
}
