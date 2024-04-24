import 'package:demo_bloc/src/blocs/login_bloc.dart';
import 'package:demo_bloc/src/resources/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = LoginBloc();
  bool showPass = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool userInvalid = false;
  bool passInvalid = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start, // bên trái của column
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const FlutterLogo(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "Hello\nwelcome to back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) => TextField(
                      controller: userController,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: 'USERNAME',
                          labelStyle: const TextStyle(
                              color: Color(0xff8888888), fontSize: 15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    StreamBuilder(
                      stream: bloc.passStream,
                      builder: (context, snapshot) => TextField(
                          controller: passController,
                          obscureText: !showPass,
                          decoration: InputDecoration(
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelText: 'PASSWORD',
                              labelStyle: const TextStyle(
                                  color: Color(0xff8888888), fontSize: 15))),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(
                        showPass ? "HIDE" : "SHOW",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FloatingActionButton(
                    onPressed: onSignInClicked,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New USER?SIGN UP',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        Text(
                          'FORGOT PASSWORD?',
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  void onSignInClicked() {
    if (bloc.isValidInfo(userController.text, passController.text)) {
        Navigator.push(context, MaterialPageRoute(builder: gotoHome));
    }
   
  }
}

Widget gotoHome(BuildContext) {
  return const HomePage();
}
