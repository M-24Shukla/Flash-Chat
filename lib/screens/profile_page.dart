import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';

bool confirmPressed = true;

class ProfilePage extends StatefulWidget {
  static String id = 'profile_page';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name, number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
//            Hero(
//              tag: 'logo',
//              child: Container(
//                height: 200.0,
//                child: Image.asset('images/logo.png'),
//              ),
//            ),
            SizedBox(
              height: 48.0,
            ),
            LabelAndField(label: 'Name', onChanged: (value) {
              name = value;
            },),
            SizedBox(
              height: 20.0,
            ),
            LabelAndField(label: 'Phn. No.', onChanged: (value) {
              number = value;
            },),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              label: 'Confirm',
              onPressed: () {
                setState(() {
                  confirmPressed = false;
                });
                // When pressed the users data gets to the cloud... And will be used later on while chatting.
              },
            )
          ],
        ),
      ),
    );
  }
}

class LabelAndField extends StatelessWidget {

  LabelAndField({this.label, this.onChanged});
  final String label;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding:EdgeInsets.only(right: 2.0),
            child: Text(
                label,
              style: TextStyle(
                fontSize: 15.0
              ),
            ),
          ),
          SizedBox(width: 48.0,),
          Flexible(
            child: TextField(
              showCursor: confirmPressed,
              focusNode: FocusNode(),
              enabled: confirmPressed ,
              enableInteractiveSelection: confirmPressed,
              textAlign: TextAlign.center,
              onChanged: onChanged,
              decoration: kTextFieldDecoration,
            ),
          ),
        ],
      ),
    );
  }
}