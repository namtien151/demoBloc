import 'dart:async';

import 'package:demo_bloc/src/validators/validations.dart';

class LoginBloc {
  final StreamController _userController = StreamController();
  final StreamController _passwordController = StreamController();
  Stream get userStream => _userController.stream ; 
  Stream get passStream => _passwordController.stream ; 


  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError('tài khoản không hợp lệ'); // sink như 1 kiểu dữ liệu đầu vào và stream như 1 dữ liệu đầu ra
       return false;
    }
     _userController.sink.add('ok'); // ok 
    if(Validations.isValidPass(password)){
      _passwordController.sink.addError('mật khẩu không hợp lệ'); 
      return false;
    } 
   
    _passwordController.sink.add('ok');
          return true;
  } 
  void dispose() { 
    _userController.close() ; 
    _passwordController.close() ;
  }
}
