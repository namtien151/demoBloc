import 'dart:async';

import 'package:demo_bloc/blocs/login_event.dart';
import 'package:demo_bloc/blocs/login_state.dart';

class LoginBloc {
  final _streamController = StreamController<LoginState>();
  Stream<LoginState> get state => _streamController.stream;
  void send(LoginEvent event) {
      switch(event) {
        case LoginEvent.login:
        _streamController.sink.add(LoginState.loading());
        Future.delayed(Duration(seconds: 2),(){
            _streamController.sink.add(LoginState.success());
        });
      }    
  }
  void dispose() {
    _streamController.close();
  }
}