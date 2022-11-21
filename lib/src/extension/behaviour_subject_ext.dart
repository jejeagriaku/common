import 'package:rxdart/rxdart.dart';

extension BehaviourSubjectExt<T> on BehaviorSubject<T> {
  BehaviorSubject<T> disposeBy(List<dynamic> disposeBag) {
    disposeBag.add(this);
    return this;
  }

  emit(T data) {
    if (!this.isClosed) {
      this.add(data);
    }
  }
}
