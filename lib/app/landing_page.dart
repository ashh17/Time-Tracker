import 'package:TimeTracker/app/home_page.dart';
import 'package:TimeTracker/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:TimeTracker/app/sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentState();
  }

  Future<void> _checkCurrentState() async {
    // async is need becoz of await
    User user = await widget.auth
        .currentUser(); //await is used bcoz currentUser() returns of type future
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        // onSignIn: (user) => _updateUser(user)
        onSignIn:
            _updateUser, // this is used because _updateUser and OnsignIn have the same signature
      );
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    ); // temprory placeholder for HomePage
  }
}
