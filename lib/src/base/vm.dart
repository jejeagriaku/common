import 'dart:async';
import 'package:rxdart/rxdart.dart';

export 'package:common/src/extension/behaviour_subject_ext.dart';
export 'package:common/src/extension/publish_subject_extension.dart';
export 'package:common/src/extension/subject_extension.dart';
export 'package:common/src/extension/stream_subscription_extension.dart';

class VM {
  List<dynamic> disposeBag = <dynamic>[];

  dispose() {
    for (var element in disposeBag) {
      if (element is Subject ||
          element is PublishSubject ||
          element is BehaviorSubject) {
        element.close();
      } else if (element is StreamSubscription) {
        element.cancel();
      }
    }
  }
}