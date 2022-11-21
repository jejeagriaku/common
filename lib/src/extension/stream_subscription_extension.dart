import 'dart:async';

extension StreamSubscriptionExtension<T> on StreamSubscription<T> {
  StreamSubscription<T> disposed(List<dynamic> disposeBag) {
    disposeBag.add(this);
    return this;
  }
}
