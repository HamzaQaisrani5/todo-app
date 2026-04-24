import 'dart:async';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class GorouterRefreshStream extends ChangeNotifier {
  GorouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel(); // TODO: implement dispose
    super.dispose();
  }
}
