import 'package:auth_ui/utils/constants.dart';
import 'package:auth_ui/utils/size_config.dart';
import 'package:auth_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.04), // 4%
                  Text(
                    "Register Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Complete your details",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  Column(
                    children: [
                      buildEmailFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildPhoneNumberFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildPasswordFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildConformPassFormField(),
                      SizedBox(height: getProportionateScreenHeight(40)),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.08),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: 20),
                  DefaultButton(
                    text: "Continue",
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return OtpScreen();
                      }));
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: getProportionateScreenWidth(5)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPhoneNumberFormField() {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20, top: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone number",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget buildConformPassFormField() {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20, top: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: true,
        onChanged: (value) {
          setState(() {
            confirmPassword = value;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_rounded),
        ),
      ),
    );
  }

  Widget buildPasswordFormField() {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20, top: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: true,
        onChanged: (value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_rounded),
        ),
      ),
    );
  }

  Widget buildEmailFormField() {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20, top: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your email",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_rounded),
        ),
      ),
    );
  }
}
