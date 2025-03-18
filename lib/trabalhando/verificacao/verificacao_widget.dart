import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'verificacao_model.dart';
export 'verificacao_model.dart';

class VerificacaoWidget extends StatefulWidget {
  const VerificacaoWidget({super.key});

  static String routeName = 'Verificacao';
  static String routePath = '/verificacao';

  @override
  State<VerificacaoWidget> createState() => _VerificacaoWidgetState();
}

class _VerificacaoWidgetState extends State<VerificacaoWidget> {
  late VerificacaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificacaoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.adm, false)) {
        context.goNamed(HomeWidget.routeName);
      } else {
        if (valueOrDefault<bool>(currentUserDocument?.statusAtivacao, false)) {
          context.goNamed(HomeWidget.routeName);
        } else {
          context.goNamed(HomeWidget.routeName);
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}
