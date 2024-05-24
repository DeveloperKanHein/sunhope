import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/login/login_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/next_screen.dart';
import 'package:sunhope_computer_software/data/login_req.dart';
import 'package:sunhope_computer_software/screens/home/home_screen.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../constants/const_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final _bloc = LoginBloc();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocProvider(
            create: (_) => _bloc,
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginRequesting) {
                  StateWidgets.showLoading(context);
                } else if (state is LoginFail) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Fail",
                      message: "Enter valid credential",
                      onPressedOK: () {
                        Navigator.pop(context);
                      });
                } else if (state is LoginError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Fail",
                      message: "Enter valid credential",
                      onPressedOK: () {
                        Navigator.pop(context);
                      });
                } else if (state is LoginSuccess) {
                  StateWidgets.hideLoading(context);
                  screenReplace(context: context, screen: const HomeScreen());
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          Image.asset(
            "assets/logo.png",
            width: 150,
          ),
          Container(
            width: 350,
            height: 50,
            margin: const EdgeInsets.only(top: 50, bottom: 30),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Username",
                prefixIcon: const Icon(Icons.person),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: ConstColors.borderColor, width: 1)),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 50,
            margin: const EdgeInsets.only(bottom: 30),
            child: TextField(
              controller: password,
              obscureText: !isVisible,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Password",
                prefixIcon: const Icon(Icons.vpn_key),
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: ConstColors.borderColor, width: 1)),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (username.text.isNotEmpty && password.text.isNotEmpty) {
                _bloc.add(RequestLogin(
                    req: LoginReq(
                        username: username.text, password: password.text)));
              }
            },
            child: Container(
              width: 350,
              height: 50,
              decoration: const BoxDecoration(
                color: ConstColors.appColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: ConstTextStyles.whiteF16W5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text(
                "Power by App4U",
                style: ConstTextStyles.blackF14W4Op45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
