import 'package:auth_ui/screens/signUp_screen.dart';
import 'package:auth_ui/utils/constants.dart';
import 'package:auth_ui/utils/size_config.dart';
import 'package:auth_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String phoneNumber;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                buildPhoneNumberFormField(),
                SizedBox(height: getProportionateScreenHeight(5)),
              ],
            ),
            Column(
              children: [
                DefaultButton(
                  text: "Continue",
                  press: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone number",
          hintStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }
}
