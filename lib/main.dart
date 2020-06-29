import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(PhoneNumberWithCode());
}

class PhoneNumberWithCode extends StatefulWidget {
  @override
  _PhoneNumberWithCodeState createState() => _PhoneNumberWithCodeState();
}

class _PhoneNumberWithCodeState extends State<PhoneNumberWithCode> {
  String textNumberPhone = '';
  String dialCodeInitial = '+966';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());

        ///another solution
//      FocusScopeNode currentFocus = FocusScope.of(context);
//      if (!currentFocus.hasPrimaryFocus) {
//        currentFocus.unfocus();
//      }
      },
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('booking salon app'),
            ),
            body: Container(
              padding: EdgeInsets.only(left: 8.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Enter your phone number',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CountryListPick(
                        showEnglishName: true,
                        // to show or hide flag
                        isShowFlag: true,
                        // true to show  title country
                        isShowTitle: false,
                        // true to show code phone country
                        isShowCode: true,
                        // to show or hide down icon
                        isDownIcon: true,
                        // to initial code number countrey
                        initialSelection: dialCodeInitial,
                        // to get feedback data from picker
                        onChanged: (CountryCode code) {
                          setState(() {
                            if (code.dialCode != null) {
                              dialCodeInitial = code.dialCode;
                            } else {
                              print('error =>>>> code.dialCode = null');
                            }
                          });
                        },
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              textNumberPhone = text;
                            });
                          },
                          decoration:
                              InputDecoration(labelText: "Enter your number"),
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ], //
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  ButtonTheme(
                    height: 60,
                    minWidth: 60,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'show full number',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          result = dialCodeInitial + ' ' + textNumberPhone;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'your phone number is   $result ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
