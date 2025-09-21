import 'package:flutter/material.dart';
import 'package:software/screens/authentication/signin.dart';
import 'package:software/authentication_constants.dart';
import 'package:hive/hive.dart';
import 'package:software/screens/global_widgets/custombutton.dart';
import 'package:software/screens/global_widgets/customcheckbox.dart';
import 'package:software/screens/global_widgets/custompasswordfeild.dart';
import 'package:software/screens/global_widgets/custumtextformfeild.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool obscurePassword1 = true;
  bool obscurePassword2 = true;
  bool isSignupTapped = false;
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String? emailValidation(String? value) {
    final email = _emailController.text.trim();
    Hive.box('usersBox');
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return 'Enter Email';
    } else if (!emailRegex.hasMatch(email) || !email.endsWith('@gmail.com')) {
      return 'Enter a Valid Gmail Address';
    }
    return null;
  }

  String? passwordvalidation(String? value) {
    final password = _passwordController.text.trim();
    if (value == null || value.isEmpty) {
      return 'Enter Password';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
    ).hasMatch(password)) {
      return 'Password must be at least 8 characters.\nInclude upper, lower, number.';
    }
    return null;
  }

  String? confirmPasswordValidation(String? value) {
    final confirmPassword = _confirmPasswordController.text.trim();
    if (value == null || value.isEmpty) {
      return 'Re-enter Password';
    } else if (confirmPassword != _passwordController.text.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> registerUser() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (!isChecked) {
      showMessage("You must agree to the terms and policy");
      return;
    }
    var box = Hive.box('usersBox');
    if (box.containsKey(email)) {
      showMessage("User already exists");
      return;
    }
    await box.put(email, password);
    showMessage("User registered successfully");
    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Sign Up', style: kHeadingSignUpTextStyle),
              const SizedBox(height: 30),
              CustomTextFormField(
                label: "Email",
                hint: "Enter you email",
                controller: _emailController,
                validator: emailValidation,
              ),
              const SizedBox(height: 30),
              CustomPasswordField(
                label: "Your passsword",
                hint: "Enter you passsword",
                controller: _passwordController,
                validator: passwordvalidation,
              ),
              const SizedBox(height: 20),
              CustomPasswordField(
                label: "Comfirm Password",
                hint: "Re-Enter Password",
                controller: _confirmPasswordController,
                validator: confirmPasswordValidation,
              ),
              const SizedBox(height: 10),
              CustomCheckboxWithText(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue ?? false;
                  });
                },
                text: 'I agree to the Terms and Privacy Policy',
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Sign Up",
                isloading: isSignupTapped,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isSignupTapped = true;
                    });

                    await Future.delayed(
                      const Duration(seconds: 3),
                    );

                    registerUser();
                    setState(() {
                      isSignupTapped = false;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Already have an account?',
                    style: kAlreadyAccountTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: const Text(
                      'Sign In',
                      style: kAlreadyAccountSignUpTextButton,
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
