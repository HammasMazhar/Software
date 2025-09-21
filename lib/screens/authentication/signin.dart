import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:software/authentication_constants.dart';
import 'package:software/screens/global_widgets/custombutton.dart';
import 'package:software/screens/global_widgets/customcheckbox.dart';
import 'package:software/screens/global_widgets/custompasswordfeild.dart';
import 'package:software/screens/global_widgets/custumtextformfeild.dart';
import 'package:software/screens/dashboard.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text('Sign In', style: kHeadingSignUpTextStyle),
              const SizedBox(height: 30),
              CustomTextFormField(
                label: "Email",
                hint: "Enter your email",
                controller: emailController,
                validator: validateEmail,
              ),
              const SizedBox(height: 40),
              CustomPasswordField(
                label: "Password",
                hint: "Enter your password",
                controller: passwordController,
                validator: validatePassword,
              ),
              const SizedBox(height: 10),
              CustomCheckboxWithText(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue ?? false;
                  });
                },
                text: 'Remember me',
              ),
              const SizedBox(height: 20),
              CustomButton(
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
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16),
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
