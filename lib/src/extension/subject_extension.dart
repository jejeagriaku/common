import 'package:rxdart/subjects.dart';

extension SubjectExtension<T> on Subject<T> {
  Subject<T> disposeBy(List<dynamic> disposeBag) {
    disposeBag.add(this);
    return this;
  }

  emit(T data) {
    if (!this.isClosed) {
      this.add(data);
    }
  }
}
