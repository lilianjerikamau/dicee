import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:text_editing_watcher/text_editing_watcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  return runApp(MyApp());
}
void toastMessage(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIos: 1,
      fontSize: 16.0
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//splash controller
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//splash view
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    // SecondScreen()
                    LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/diceelogo.png'),
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
      height: double.infinity,
      width: double.infinity,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController(text: "name");
  TextEditingController passwordController = TextEditingController();
  String _email, _password = "";
  FocusNode _focusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         autovalidate: false,
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: ListView(
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   'Dicee',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 30),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   'Sign in',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(),
//                     labelText: 'User Name',
//
//                   ),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter name';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 child: TextFormField(
//                   obscureText: true,
//                   key: _passwordFieldKey,
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(),
//                     labelText: 'Password',
//
//                   ),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Please enter password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 child: TextFormField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     focusedBorder: OutlineInputBorder(),
//                     hintText: 'Confirm Password',
//
//                   ),
//                   validator: (value) {
//                     if (value != _passwordFieldKey.currentState.value) {
//                       return 'Password do not match';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   //forgot password
//                 },
//                 textColor: Colors.white,
//                 child: Text('Forgot Password'),
//               ),
//               Container(
//                   height: 50,
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: TextEditingWatcher(
//                     controller: nameController,
//                     builder: (text) => RaisedButton(
//                       textColor: Colors.white,
//                       color: Colors.red,
//                       child: Text('Login'),
//                       onPressed: text.isNotEmpty
//                           ? () {
//                               if (_formKey.currentState.validate()) {
//                                 print("Process data");
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (BuildContext context) =>
//                                             SecondScreen()));
//                               } else {
//                                 print('Error');
//                               }
//                             }
//                           : null,
//                     ),
//                   )),
//               Container(
//                   child: Row(
//                 children: <Widget>[
//                   Text('Does not have account?'),
//                   FlatButton(
//                     textColor: Colors.red,
//                     child: Text(
//                       'Sign in',
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text("Login instead"),
//                       ));
//                     },
//                   )
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.center,
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        autovalidate: false,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              'https://images.unsplash.com/photo-1547638375-ebf04735d792?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1534&q=80',
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'images/diceelogo.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        height: 300,
                        width: 300,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  autofocus: false,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.email),
                                    labelText: 'tom@dukaree.com',
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty)
                                      return 'Email can not be empty';
                                    else if (!value.contains('@dukaree.com')){
                                      return 'Enter valid email';
                                    }else{
                                      return null;
                                    }
                                  }
                                  ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 25,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  autocorrect: false,
                                  autofocus: false,
                                  obscureText: true,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.lock),
                                    labelText: 'Password',
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                  validator: (password) {
                                    if (password.isEmpty)
                                      return 'Password can not be empty';
                                   else if (password.length < 6){
                                      return 'Password must be six or more characters';
                                    }
                                   else{
                                     return null;
                                    }
                                  },
                                  onSaved: (password) => _password = password,
                                ),
                              ),
                             new MaterialButton (
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SecondScreen()));
                                  } else {
                                    toastMessage("Error");
                                    print('Error');
                                  }
                                },
                                minWidth: 250,
                                splashColor: Colors.green,
                                color: Colors.red,
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 5;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  getDiceNumber();
                });
                print('press1');
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  getDiceNumber();
                });
                print('pressed2');
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  void getDiceNumber() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Center(
          child: Text('Dicee'),
        ),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ));
  }
}
// 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