import 'package:flutter/material.dart';
import 'package:onita_app/views/bouncy_page_route.dart';
import 'package:onita_app/views/child/student_dashboard.dart';
import 'package:onita_app/views/parent/sign_up_form.dart';
import 'package:onita_app/views/parent/children.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:onita_app/o_level_caricular.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode _focusNode = FocusNode();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController password2 = TextEditingController();
  String msg = '';
  Widget circulaProgressBar = CircularProgressIndicator();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 400.0,
        width: 400.0,
        padding: const EdgeInsets.all(8.0),
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.redAccent,
                automaticallyImplyLeading: false,
                title: Text('Sign in Options'),
                centerTitle: true,
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(text:'Parent/Teacher', icon: Icon(Icons.supervisor_account)),
                      Tab(text:'Child', icon: Icon(Icons.child_care))
                    ]
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                            child: TextField(
                              controller: username,
                              obscureText: false,
                              cursorColor: Colors.redAccent,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
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
                            padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              cursorColor: Colors.redAccent,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
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
                              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  FlatButton.icon(
                                    onPressed: () async {
                                      await loginAction(username, password, context, msg);
                                    },
                                    icon: Icon(Icons.arrow_forward),
                                    label: Text(
                                        'Sign in',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    color: Colors.redAccent,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(width: 5.0,),
                                  FlatButton.icon(
                                    onPressed: (){
                                      Navigator.push(context, BouncyPageRoute(widget: SignUpForm()));
                                    },
                                    icon: Icon(Icons.person_add),
                                    label: Text(
                                        'Sign up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    color: Colors.redAccent,
                                    textColor: Colors.white,
                                  )
                                ],
                              )

                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                            child: TextField(
                              controller: telephone,
                              obscureText: false,
                              cursorColor: Colors.redAccent,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Telephone',
                                labelStyle: TextStyle(
                                  color: _focusNode.hasFocus ? Colors.redAccent : Colors.black,
                                ),
                                focusedBorder:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                            child: TextField(
                              controller: password2,
                              obscureText: true,
                              cursorColor: Colors.redAccent,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
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
                              padding: const EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
                              child: FlatButton.icon(
                                onPressed: () async {
                                  await loginChild(telephone, password2, context, msg);
                                  },
                                icon: Icon(Icons.arrow_forward),
                                label: Text('Sign in'),
                                color: Colors.redAccent,
                                textColor: Colors.white,
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}


Future<List<DocumentSnapshot>> loginChild(telephone, password2, context, msg) async {
  Widget cancelButton = FlatButton(
    child: Text(
      "Ok",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          fontFamily: 'Roboto',
          color: Colors.black
      ),
    ),
    onPressed:  () {
      msg = '';
      Navigator.pop(context);
    },
  );

  if(telephone.text == ''){msg+='Telephone field is required. \n';}
  if(password2.text == ''){msg+='Password field is required. \n';}
  if(msg != ''){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Text('Alert'),
              content: Text(
                msg,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    color: Colors.redAccent
                ),
              ),
              actions: [
                cancelButton
              ]
          );
        }
    );
  }else{
    var docs = await Firestore.instance
        .collection('learners')
        .where('contacts', arrayContains: telephone.text)
        .where('password', isEqualTo: password2.text)
        .getDocuments();

    if(docs.documents.length == 0){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
                title: Text('Alert'),
                content: Text(
                  'Invalid Details!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      color: Colors.redAccent
                  ),
                ),
                actions: [
                  cancelButton
                ]
            );
          }
      );
    }else{
      Navigator.push(context, BouncyPageRoute(widget: DashBoard(docs.documents[0])));
    }
  }
}

Future<List<DocumentSnapshot>> loginAction(username, password, context, msg) async {
  Widget cancelButton = FlatButton(
    child: Text(
      "Ok",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          fontFamily: 'Roboto',
          color: Colors.black
      ),
    ),
    onPressed:  () {
      msg = '';
      Navigator.pop(context);
    },
  );
  if(username.text == ''){msg+='Username field is required. \n';}
  if(password.text == ''){msg+='Password field is required. \n';}
  if(msg != ''){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Text('Alert'),
              content: Text(
                msg,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    color: Colors.redAccent
                ),
              ),
              actions: [
                cancelButton
              ]
          );
        }
    );
  }else{
    var docs = await Firestore.instance
        .collection('parents')
        .where('username', isEqualTo: username.text)
        .where('password', isEqualTo: password.text)
        .getDocuments();

    if (docs.documents.length == 0){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
                title: Text('Alert'),
                content: Text(
                  'Invalid Details!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      color: Colors.redAccent
                  ),
                ),
                actions: [
                  cancelButton
                ]
            );
          }
      );
    }else{
      DocumentSnapshot doc = docs.documents[0];
      Navigator.push(context, BouncyPageRouteSnap(Children(), doc));
    }
  }


}
