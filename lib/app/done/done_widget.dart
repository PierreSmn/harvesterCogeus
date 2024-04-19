import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'done_model.dart';
export 'done_model.dart';

class DoneWidget extends StatefulWidget {
  const DoneWidget({super.key});

  @override
  State<DoneWidget> createState() => _DoneWidgetState();
}

class _DoneWidgetState extends State<DoneWidget> {
  late DoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoneModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().validatedDone) {
        context.safePop();
      }
    });

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
        final doneGetSupaResponse = snapshot.data!;
        return Title(
            title: 'done',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            valueOrDefault<String>(
                              GetSupaCall.logoURL(
                                doneGetSupaResponse.jsonBody,
                              ),
                              'https://99designs-blog.imgix.net/blog/wp-content/uploads/2016/08/featured.png?auto=format&q=60&w=2060&h=1158.75&fit=crop&crop=faces',
                            ),
                            height: 60.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 30.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 400.0,
                                    decoration: const BoxDecoration(),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: const [
                                          TextSpan(
                                            text:
                                                'Votre participation est validé !',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: colorFromCssString(
                                                GetSupaCall.colorTitle(
                                                  doneGetSupaResponse.jsonBody,
                                                )!,
                                                defaultColor: Colors.black,
                                              ),
                                              fontSize: 27.0,
                                              letterSpacing: -1,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.network(
                                      GetSupaCall.imageURL(
                                        doneGetSupaResponse.jsonBody,
                                      )!,
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: Container(
                                      width: 400.0,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text:
                                                      'En attendant le tirage ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: GetSupaCall.brand(
                                                    doneGetSupaResponse
                                                        .jsonBody,
                                                  )!,
                                                  style: TextStyle(
                                                    color: colorFromCssString(
                                                      GetSupaCall.colorButton(
                                                        doneGetSupaResponse
                                                            .jsonBody,
                                                      )!,
                                                      defaultColor:
                                                          Colors.black,
                                                    ),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                const TextSpan(
                                                  text:
                                                      ' vous offre un code pour ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: GetSupaCall
                                                      .descriptionCodePromo(
                                                    doneGetSupaResponse
                                                        .jsonBody,
                                                  )!,
                                                  style: const TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .appleTxt1,
                                                        fontSize: 16.7,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text:
                                                          GetSupaCall.codePromo(
                                                doneGetSupaResponse.jsonBody,
                                              )!));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Le code a bien été copié!',
                                                    style: TextStyle(
                                                      color: colorFromCssString(
                                                        GetSupaCall
                                                            .colorButtonText(
                                                          doneGetSupaResponse
                                                              .jsonBody,
                                                        )!,
                                                        defaultColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      colorFromCssString(
                                                    GetSupaCall.colorButton(
                                                      doneGetSupaResponse
                                                          .jsonBody,
                                                    )!,
                                                    defaultColor: Colors.black,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.content_copy_outlined,
                                                  color: colorFromCssString(
                                                    GetSupaCall.colorButton(
                                                      doneGetSupaResponse
                                                          .jsonBody,
                                                    )!,
                                                    defaultColor: Colors.black,
                                                  ),
                                                  size: 26.0,
                                                ),
                                                Text(
                                                  GetSupaCall.codePromo(
                                                    doneGetSupaResponse
                                                        .jsonBody,
                                                  )!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            colorFromCssString(
                                                          GetSupaCall
                                                              .colorButton(
                                                            doneGetSupaResponse
                                                                .jsonBody,
                                                          )!,
                                                          defaultColor:
                                                              Colors.black,
                                                        ),
                                                        fontSize: 21.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(width: 6.0)),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 14.0)),
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
