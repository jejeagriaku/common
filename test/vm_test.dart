import 'dart:async';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("DisposeBag Management", () {
    VM vm = VM();
    PublishSubject<bool> subject =
        PublishSubject<bool>().disposeBy(vm.disposeBag);
    BehaviorSubject<String> behaviorSubject =
        BehaviorSubject.seeded("").disposeBy(vm.disposeBag);
    StreamController<num> _controller = StreamController<num>();
    Stream<num> stream = _controller.stream;
    StreamSubscription subscription =
        stream.listen((event) {}).disposed(vm.disposeBag);

    test("Test Adding DisposeBag", () {
      expect(vm.disposeBag.contains(subject), true);
      expect(vm.disposeBag.contains(behaviorSubject), true);
      expect(vm.disposeBag.contains(subscription), true);
    });

    test("Test Disposing DisposeBag", () {
      vm.dispose();

      expect(subject.isClosed, true);
      expect(behaviorSubject.isClosed, true);
      expect(_controller.hasListener, false);
    });
  });
}
