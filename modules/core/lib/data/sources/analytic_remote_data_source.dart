import 'package:firebase_analytics/firebase_analytics.dart';

import '../../common/exception.dart';
import '../../common/logger.dart';

abstract class AnalyticRemoteDataSource {
  Future<void> logSelectedContent(
    String contentType,
    String contentId,
  );
}

class AnalyticRemoteDataSourceImpl implements AnalyticRemoteDataSource {
  final FirebaseAnalytics _plugin;

  AnalyticRemoteDataSourceImpl(this._plugin);

  @override
  Future<void> logSelectedContent(String contentType, String contentId) async {
    try {
      await _plugin.logSelectContent(
        contentType: contentType,
        itemId: contentId,
      );
    } catch (error) {
      Logger.error(
        error,
        event:
            'executing logSelectedContent method on $AnalyticRemoteDataSourceImpl',
      );

      throw ServerException();
    }
  }
}
