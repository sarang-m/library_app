import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_app/screens/home/home.dart';
import 'package:library_app/screens/signup/signup_screen.dart';
import 'package:library_app/services/auth.dart';
import 'package:library_app/utils/screen_size.dart';
import 'package:library_app/utils/themes/constants.dart';
import 'package:library_app/utils/themes/custom_text.dart';
import 'package:library_app/widgets/Input_widget.dart';
import 'package:library_app/widgets/container_widget.dart';

class LoginForm extends StatelessWidget {
  final FirebaseAuth auth;
  LoginForm({this.auth});

  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  String _email;
  String _password;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future _submit(context) async {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();

      //TODO: Navigator.of(context).pushReplacementNamed(HomeScreen.tag);
      final String retvalue =
          await Auth(auth: auth).signIn(email: _email, password: _password);
      if (retvalue == "Success") {
        Navigator.of(context).pushNamed(HomeScreen.tag);
      } else {
        return Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid email or password"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double h = SizeConfig.safeBlockVertical;
    final double w = SizeConfig.safeBlockHorizontal;

    return Form(
      key: formkey,
      child: ContainerWidget(
        child: Column(
          children: [
            Text(
              "Login",
              style: CustomTextStyle.headline2(context),
            ),
            SizedBox(
              //20
              height: h * 2.6,
            ),
            InputWidget(
              inputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
              textInputType: TextInputType.emailAddress,
              controller: _emailController,
              onChanged: (newEmail) => _email = newEmail,
              validator: (String value) {
                return !value.contains("@") ? "Invalid email" : null;
              },
              icon: Icons.email_outlined,
              hintText: "Email",
            ),
            SizedBox(
              height: h * 2.6,
            ),
            InputWidget(
              controller: _passwordController,
              onChanged: (newPassword) => _password = newPassword,
              validator: (String value) {
                return value.length > 6 ? null : "Password is too short";
              },
              inputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
              icon: Icons.lock_outline,
              hintText: "Password",
              obscureText: true,
            ),
            SizedBox(
              height: h * 2.6,
            ),
            RaisedButton(
              onPressed: () {
                _submit(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: darkGray,
              textColor: Colors.white,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: h * 10, vertical: h * 1),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

//            MaterialButton(
//              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
//              colorBrightness: Brightness.dark,
//              color: Theme.of(context).secondaryHeaderColor,
//              elevation: 4.0,
//              onPressed: () {
//                _submit(context);
//              },
//              child: Text(
//                "Login",
//                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//              ),
//            ),

            FlatButton(
              onPressed: () {
                Auth(auth: auth)
                    .createAccount(email: _email, password: _password);
                Navigator.of(context).pushNamed(SignUpScreen.tag);
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              splashColor: null,
              textColor: Colors.blue.shade700,
              child: Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
