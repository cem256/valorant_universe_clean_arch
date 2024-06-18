import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_universe_remastered/core/utility/logger/logger_utils.dart';

final class CustomBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerUtils.instance.logError('${bloc.runtimeType} $error');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    LoggerUtils.instance.logInfo('Created: ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    LoggerUtils.instance.logInfo('Closed: ${bloc.runtimeType}');
  }
}
