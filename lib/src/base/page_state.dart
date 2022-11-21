

import 'package:common/src/enums/state_type.dart';

class PageState<T> {
  StateType _state = StateType.loading;
  String _error = "";
  late T _data;

  /// To set the state to loading

  PageState.loading() {
    _state = StateType.loading;
  }

  /// To set the state to empty

  PageState.empty() {
    _state = StateType.empty;
  }

  /// To set the state to error
  /// @param:
  /// - [error] : [String]

  PageState.error(String error) {
    _state = StateType.error;
    _error = error;
  }

  /// To set the state to success
  /// @param:
  /// - [data] : [T] where [T] can be any classes or types

  PageState.success(T data) {
    _state = StateType.success;
    _data = data;
  }

  /// To get the current state
  /// @return:
  /// - [StateType]

  StateType getState() {
    return _state;
  }

  /// To get the error message
  /// @return:
  /// - [String]

  String getError() {
    return _error;
  }

  /// To get the data
  /// @return:
  /// - [T] where [T] can be any classess or types

  T getData() {
    return _data;
  }
}