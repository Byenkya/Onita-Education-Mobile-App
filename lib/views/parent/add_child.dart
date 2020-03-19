import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class AddChild extends StatefulWidget {
  final DocumentSnapshot document;
  const AddChild(this.document);
  @override
  _AddChildState createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  FocusNode _focusNode = FocusNode();
  TextEditingController surname = TextEditingController();
  TextEditingController onames = TextEditingController();
  TextEditingController school = TextEditingController();
  TextEditingController password = TextEditingController();
  var dob = '';
  String msg = '';
  String radioItem = '';
  String level = '';
  String lvl = 'Class';
  DateTime  selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950,1),
      lastDate: DateTime(2101)
    );

    if(picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
        dob = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Add child'),
      content: Container(
        height: 400.0,
        width: 400.0,
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Column(
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                    'Bio information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: surname,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Surname',
                      labelStyle: TextStyle(
                        color: _focusNode.hasFocus ? Colors.redAccent : Colors.black,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: onames,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Other names',
                      labelStyle: TextStyle(
                        color: _focusNode.hasFocus ? Colors.redAccent : Colors.black,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
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
                ),
                SizedBox(height: 10.0,),
                FlatButton.icon(
                  icon: Icon(Icons.date_range),
                  onPressed: (){
                    _selectDate(context);
                    },
                  label: Text("${selectedDate.toLocal()}".split(' ')[0]),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                ),
                SizedBox(height: 10.0,),
                Text(
                  'School information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: school,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'School name',
                      labelStyle: TextStyle(
                        color: _focusNode.hasFocus ? Colors.redAccent : Colors.black,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(lvl,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          fontFamily: 'Roboto',
                          color: Colors.black
                      ),
                    ),
                    DropdownButton<String>(
                      focusColor: Colors.redAccent,
                      items: <String>['Senior 1', 'Senior 2', 'Senior 3', 'Senior 4', 'Senior 5', 'Senior 6'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                              value,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                fontFamily: 'Roboto',
                                color: Colors.black
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value){
                        if(value == 'Senior 1'){
                          level = '1';
                          setState(() {
                            lvl = 'Senior 1';
                          });
                        }else if(value == 'Senior 2'){
                          level = '2';
                          setState(() {
                            lvl = 'Senior 2';
                          });
                        }else if(value == 'Senior 3'){
                          level = '3';
                          setState(() {
                            lvl = 'Senior 3';
                          });
                        }else if(value == 'Senior 4'){
                          level = '4';
                          setState(() {
                            lvl = 'Senior 4';
                          });
                        }else if(value == 'Senior 5'){
                          level = '5';
                          setState(() {
                            lvl = 'Senior 5';
                          });
                        }else{
                          level = '6';
                          setState(() {
                            lvl = 'Senior 6';
                          });
                        }
                        },
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Divider(),
                Text(
                    'Account information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  'create a unique password for each child',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    fontFamily: 'Roboto',
                    color: Colors.redAccent
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
                SizedBox(height: 10.0,),
                FlatButton.icon(
                    onPressed: (){
                      Widget cancelButton = FlatButton(
                        child: Text(
                            "Cancel",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              fontFamily: 'Roboto',
                              color: Colors.black
                          ),
                        ),
                        onPressed:  () {Navigator.pop(context); msg='';},
                      );
                      if(surname.text == ''){msg+='Surname field required \n';}
                      if(onames.text == ''){msg+='Other names field required \n';}
                      if(school.text == ''){msg+='School field required \n';}
                      if(lvl == 'Class'){msg+='Class field required \n';}

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
                        Firestore.instance.collection('learners').document()
                            .setData(
                            {
                              'sname': surname.text,
                              'oname': onames.text,
                              'gender': radioItem,
                              'dob': dob,
                              'current_level': int.parse(level),
                              'contacts': [widget.document['mobile']],
                              'parent': [
                                {
                                  'email': widget.document['email'],
                                  'gender': widget.document['gender'],
                                  'mobile': widget.document['mobile'],
                                  'nin': widget.document['nin'],
                                  'occupation': widget.document['occupation'],
                                  'oname': widget.document['oname'],
                                  'passport': '',
                                  'qualification': '',
                                  'sname': widget.document['sname']

                                }
                              ],
                              'schools': [
                                {
                                  'emis': '',
                                  'level': level,
                                  'name': school.text,
                                  'term': '',
                                  'year': ''
                                }
                              ],
                              'password': password.text

                            });
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.save),
                    label: Text(
                        "Add child",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                    color: Colors.redAccent,
                    textColor: Colors.white
                )
              ],
        ),
          ],
        ),
      ),
    );
  }
}
