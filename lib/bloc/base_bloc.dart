import 'package:rxdart/rxdart.dart';

abstract class BaseBloC {
  var _isLoading = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading => _isLoading.stream;

  showLoading() {
    _isLoading.add(true);
  }

  hideLoading() {
    _isLoading.add(false);
  }

  void dispose() {
    _isLoading.close();
  }
}
