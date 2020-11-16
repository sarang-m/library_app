import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_app/screens/home/home.dart';
import 'package:library_app/utils/themes/constants.dart';
import 'package:library_app/widgets/Input_widget.dart';
import 'package:library_app/widgets/container_widget.dart';

class SignUpForm extends StatelessWidget {

  String _password;
  String _confirmPassword;

  final formKey = GlobalKey<FormState>();

  void _createAccount(context) {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      Navigator.of(context).pushNamed(HomeScreen.tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ContainerWidget(
        child: Column(
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            InputWidget(
              validator: (value){
                return value.isEmpty?"Invalid name":null;
              },
              hintText: "Full Name",
              icon: Icons.person_outline,
            ),
            SizedBox(
              height: 20,
            ),
            InputWidget(
              validator: (String value) {
                return !value.contains("@") ? "Invalid email" : null;
              },
              textInputType: TextInputType.emailAddress,
              inputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
              hintText: "Email",
              icon: Icons.email_outlined,
            ),
            SizedBox(
              height: 20,
            ),
            InputWidget(
              onChanged: (newPassword)=> _password = newPassword,
              validator: (String value) {
                return value.length > 6 ? null : "Password is too short";
              },
              inputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
              hintText: "Password",
              obscureText: true,
              icon: Icons.lock_outline,
            ),
            SizedBox(
              height: 20,
            ),
            InputWidget(
              onChanged: (newConfirmPass)=>_confirmPassword = newConfirmPass,
              validator: (String value) {
                return _password == _confirmPassword
                    ? null
                    : "Password not match";
              },
              inputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
              hintText: "Confirm Password",
              obscureText: true,
              icon: Icons.lock_open_outlined,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                _createAccount(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: darkGray,
              textColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Create",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
