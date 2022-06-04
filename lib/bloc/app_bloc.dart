import 'package:demo_test/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class AppBloC extends BaseBloC {
  var _isDarkObject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isDarkStream => _isDarkObject.stream;

  set isDark(bool newVal) => _isDarkObject.add(newVal);

  @override
  void dispose() {
    _isDarkObject.close();
    super.dispose();
  }
}
