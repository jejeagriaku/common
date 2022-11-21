import 'package:rxdart/rxdart.dart';

extension PublishSubjectExtension<T> on PublishSubject<T> {
  PublishSubject<T> disposeBy(List<dynamic> disposeBag) {
    disposeBag.add(this);
    return this;
  }

  emit(T data) {
    if (!this.isClosed) {
      this.add(data);
    }
  }
}
