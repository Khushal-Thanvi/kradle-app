import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late FToast fToast;

  bool visiblePass = true;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: const Text(
        "Wrong username or password",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
          ),
        ),
      );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }


  Map users = {
    "Raavi" : "RB1950",
    "Khushal" : "KT1960",
    "Gatik": "GP1970"
  };

  final usernameController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kradle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: "DeliusSwashCaps",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.purple,
              ),
            ),
            const Text(
              "The Kradle App",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "DeliusSwashCaps",
                fontWeight: FontWeight.normal,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 10,),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child:  TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextField(
                controller: passController,
                obscureText: visiblePass,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: (visiblePass) ? const Icon(Icons.remove_red_eye_outlined) : const Icon(Icons.remove_red_eye),
                    tooltip: 'Show password',
                    onPressed: () {
                      setState(() {
                        visiblePass = !visiblePass;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Enter your Password',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 20, 15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text == "Raavi" && passController.text == "1234") {
                  Navigator.pushNamed(context, '/scare');
                } else {
                  if (users.containsKey(usernameController.text) && users[usernameController.text] == passController.text) {
                    Navigator.pushNamed(context, '/dashboard');
                  } else {
                    _showToast();
                  }
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber)
              ),
              child: const Padding(
                padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 140),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25,),
            const Text(
              "New on our platform?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            const Text(
              "Create new account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}