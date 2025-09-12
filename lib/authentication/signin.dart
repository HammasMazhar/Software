import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:software/authenticationconstants.dart';
import 'package:software/reuseable_widget/custombutton.dart';
import 'package:software/reuseable_widget/customcheckbox.dart';
import 'package:software/reuseable_widget/custumtextformfeild.dart';
import 'package:software/screens/dashboard.dart';
import 'signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool obscurePassword = true;

  bool isAnyTapped = false;
  bool loginTapped = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void loginUser() {
    String email = emailController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showMessage("Please fill in all fields");
      return;
    }

    var box = Hive.box('usersBox');

    if (!box.containsKey(email)) {
      showMessage("User not found");
      return;
    }

    if (isChecked) {
      final sessionBox = Hive.box('sessionBox');

      sessionBox.put('isSignedIn', true);
      sessionBox.put('currentUserEmail', email);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));

    showMessage("Sign in successful!");
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final email = emailController.text.trim();
    final userBox = Hive.box('usersBox');

    if (value == null || value.isEmpty) {
      return 'Please enter your Password';
    } else if (userBox.containsKey(email)) {
      String storedPassword = userBox.get(email);
      if (value != storedPassword) {
        return 'Incorrect password';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0XFF011B30),
      backgroundColor: const Color(0xFF008000),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 20),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: const Text('Sign in ', style: kHeadingSignInTextStyle),
                ),
              ),
              const SizedBox(height: 100),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextFormField(
                    label: "Email",
                    hint: "Enter your Email",
                    controller: emailController,
                    validator: validateEmail,
                  )),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        label: "Password",
                        hint: "Enter your Password",
                        controller: passwordController,
                        validator: validatePassword,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 10,
                      ),
                      child: CustomCheckboxWithText(
                        value: isChecked,
                        onChanged: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        text: 'Remember me',
                      )),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: CustomButton(
                      text: "Sign in",
                      isloading: loginTapped,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loginTapped = true;
                          });

                          await Future.delayed(
                            const Duration(seconds: 3),
                          );

                          loginUser();
                          setState(() {
                            loginTapped = false;
                          });
                        }
                      },
                    )),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
