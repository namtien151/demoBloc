import 'package:demo_bloc/blocs/login_bloc.dart';
import 'package:demo_bloc/blocs/login_event.dart';
import 'package:demo_bloc/blocs/login_state.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginBloc = LoginBloc();
  onPressed() {
    loginBloc.send(LoginEvent.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: loginBloc.state,
        builder: (context, snapshot) {
          if (snapshot.data!.isLoading) {
            return const CircularProgressIndicator();
          } else if (snapshot.data!.isFailure) {
            return const Text('Login Failed');
          } else {
            return const Text('Login success');
          }
        },
        initialData: LoginState.initial(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: const Color(0x00000000),
        child: const Icon(Icons.login),
      ),
    );
  }
}
