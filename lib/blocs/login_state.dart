import 'dart:isolate';

class LoginState {
  final bool isLoading ; 
  final bool isSuccess ; 
  final bool isFailure ; 
  LoginState({required this.isLoading , required this.isSuccess , required this.isFailure}) ;
  factory LoginState.initial() { // trạng thái ban đầu 
    return LoginState(isLoading:false, isSuccess:false, isFailure:true);
  }
   factory LoginState.loading() {
    return LoginState(isLoading:true, isSuccess:false, isFailure:false);
  }
  factory LoginState.success() {
    return LoginState(isLoading:false, isSuccess:true, isFailure:false);
  }
   factory LoginState.failure() { // trạng thái ban đầu 
    return LoginState(isLoading:false, isSuccess:false, isFailure:true);
  }
 
}