import 'package:core/domain/entities/watchlist.dart';
import 'package:flutter/cupertino.dart';

import '../../common/state_enum.dart';

abstract class SearchEntertainmentNotifier extends ChangeNotifier {
  bool _isDisposed = false;

  List<Watchlist> get results;

  String get message;

  RequestState get state;

  Future<void> search(String query);

  @override
  void notifyListeners() {
    if (_isDisposed) {
      return;
    }
    super.notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
