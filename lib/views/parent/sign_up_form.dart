import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onita_app/main.dart';
import 'package:onita_app/views/bouncy_page_route.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController surname = TextEditingController();
  TextEditingController other_names = TextEditingController();
  TextEditingController nin = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  String radioItem = '';
  String msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up Form"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: (){
            Widget cancelButton = FlatButton(
              child: Text("Cancel"),
              onPressed:  () {Navigator.pop(context); msg='';},
            );
            if (surname.text == ''){msg+='Surname field is required\n';}
            if (other_names.text == ''){msg+='Other names field is required\n';}
            if (telephone.text == ''){msg+='Telephone field is required\n';}
            if (radioItem == ''){msg+='Sex field is required\n';}
            if (password.text == ''){msg+='Password field is required\n';}
            if (confirm.text == ''){msg+='Password field is required\n';}
            if (password.text != confirm.text){msg+='Password Miss Match\n';}
            if(msg != ''){
              //show dialog
              showDialog(
                  context: context,
                builder: (BuildContext context){
                    return AlertDialog(
                        title: Text('Missing details'),
                        content: Text(msg),
                        actions: [
                          cancelButton
                        ]
                    );
                }
              );
            }else{
              Firestore.instance.collection('parents').document()
                  .setData(
                  {
                    'sname': surname.text,
                    'oname': other_names.text,
                    'mobile': telephone.text,
                    'nin': nin.text,
                    'email': email.text,
                    'gender': radioItem,
                    'occupation': occupation.text,
                    'password':password.text,
                    'username': telephone.text
                  }
              );
              Navigator.push(context, BouncyPageRoute(widget: MyApp()));
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                        title: Text('Success'),
                        content: Text('Parents details stored successfully!.'),
                        actions: [
                          cancelButton
                        ]
                    );
                  }
              );
            }

          },
          )
        ],
      ),
      body:SingleChildScrollView(
        child:  Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Center(
              child: Text(
                "Personal details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    color: Colors.black
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.redAccent,),
              title: TextField(
                controller: surname,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  hintText: "Surname",
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_pin, color: Colors.redAccent,),
              title: TextField(
                controller: other_names,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  hintText: "Other names",
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.redAccent,),
              title: TextField(
                controller: nin,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  hintText: "National ID (NIN)",
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RadioListTile(
                  groupValue: radioItem,
                  title: Text('Male'),
                  value: 'Male',
                  onChanged: (val) {
                    setState(() {
                      radioItem = val;
                    });
                  },
                  activeColor: Colors.redAccent,
                ),

                RadioListTile(
                  groupValue: radioItem,
                  title: Text('Female'),
                  value: 'Female',
                  onChanged: (val) {
                    setState(() {
                      radioItem = val;
                    });
                  },
                  activeColor: Colors.redAccent,
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.redAccent,),
              title: TextField(
                controller: telephone,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  hintText: "Telephone number",
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.redAccent,),
              title: TextField(
                controller: email,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                    hintText: "Email address",
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            ListTile(
              leading: Icon(Icons.accessibility, color: Colors.redAccent,),
              title: TextField(
                controller: occupation,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  hintText: "Occupation",
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 20.0,),
            Center(
              child: Text(
                "Account details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    color: Colors.black
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.redAccent,),
              title: TextField(
                controller: password,
                cursorColor: Colors.redAccent,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'password',
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock_outline, color: Colors.redAccent,),
              title: TextField(
                controller: confirm,
                obscureText: true,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                    hintText: 'Confirm password',
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
