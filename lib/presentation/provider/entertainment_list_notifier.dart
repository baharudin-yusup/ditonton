import 'package:flutter/cupertino.dart';

import '../../common/state_enum.dart';
import '../../domain/entities/watchlist.dart';

abstract class EntertainmentListNotifier extends ChangeNotifier {
  bool _isDisposed = false;

  RequestState get state;

  String get message;

  List<Watchlist> get list;

  void setId(int id) {}

  void next();

  void previous();

  Future<void> fetch();

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
