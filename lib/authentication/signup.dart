import 'package:flutter/material.dart';
import 'package:software/authentication/signin.dart';
import 'package:software/authenticationconstants.dart';
import 'package:hive/hive.dart';
import 'package:software/reuseable_widget/custombutton.dart';
import 'package:software/reuseable_widget/customcheckbox.dart';
import 'package:software/reuseable_widget/custompasswordfeild.dart';
import 'package:software/reuseable_widget/custumtextformfeild.dart';

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

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String? firstnameValidation(String? value) {
    final firstName = _firstNameController.text.trim();
    if (value == null || value.isEmpty) {
      return ' Enter first Name';
    } else if (firstName.length < 2) {
      return 'At least 2 characters long';
    }
    return null;
  }

  String? lastnameValidation(String? value) {
    final firstName = _lastNameController.text.trim();
    if (value == null || value.isEmpty) {
      return ' Enter Last Name';
    } else if (firstName.length < 2) {
      return 'At least 2 characters long';
    }
    return null;
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
      return 'Password must contain at least one uppercase ,one lowercase letter,one digit,one special character.';
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008000),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Sign Up', style: kHeadingSignUpTextStyle),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CustomTextFormField(
                          label: "First name",
                          hint: "Enter your first name",
                          controller: _firstNameController,
                          validator: firstnameValidation),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CustomTextFormField(
                            label: "Last name",
                            hint: "Enter your last name",
                            controller: _lastNameController,
                            validator: lastnameValidation)),
                  ),
                ],
              ),
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
              const SizedBox(height: 20),
              CustomCheckboxWithText(
                value: isChecked,
                onChanged: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                text: 'I agree to the Terms and Privacy Policy',
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(right: 80, left: 80),
                    child: CustomButton(
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
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: kAlreadyAccountTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signin()));
                    },
                    child: const Text(
                      'Sign In',
                      style: kAlreadyAccountSignUpTextButton,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Signup Requirements:',
                style: kRequirementHeadingTextStyle,
              ),
              const SizedBox(height: 8),
              const Text(
                '• Full Name must include at least **two words** (e.g., John Doe)\n'
                '• Email must be valid and end with "@gmail.com"\n'
                '• Password must be at least 8 characters and include:\n'
                '     - At least one uppercase letter\n'
                '     - At least one lowercase letter\n'
                '     - At least one digit\n'
                '     - At least one special character (!@#\$&*~)\n'
                '• Confirm Password must match the Password\n'
                '• You must agree to the Terms and Privacy Policy checkbox',
                style: kRequirementsTextStyle,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
