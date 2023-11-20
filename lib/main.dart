import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp( home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  void _showDialog(BuildContext context) {
// flutter defined function
    showDialog(
      context: context, builder: (BuildContext context) {
// return object of type Dialog
      return AlertDialog(
        title: Text("Alert Message"),
        // Retrieve the text which the user has entered by
        // using the TextEditingController.
        content: Text(mycontroller.text),
        actions: <Widget>[
          new ElevatedButton(
            child: new Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
    );
  }
  String value = "";
  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Example'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                    onChanged: (text) {
                      value = text;
                      print(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    maxLength: 8,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    controller: mycontroller,
                  ),
                ),
                ElevatedButton(
                  //textColor: Colors.white,
                  //color: Colors.blue,
                  child: Text('Sign In'),
                   onPressed: (){
                    print("The Username is "+value);
                    print("the Password is "+mycontroller.text);
                    _showDialog(context);
                  },
                )
              ],
            )
        )
    );
  }
}