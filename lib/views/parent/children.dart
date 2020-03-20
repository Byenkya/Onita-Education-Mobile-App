import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onita_app/views/parent/add_child.dart';
import 'package:onita_app/views/bouncy_page_route.dart';
import 'package:onita_app/views/parent/childz_subjects.dart';

class Children extends StatefulWidget {
  @override
  _ChildrenState createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot document = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
            'CHILDREN',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              fontFamily: 'Roboto',
              color: Colors.white
          ),
        ),
        centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (String result){ print(result);},
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: "Logout", child: Text('Logout'),
                )
              ],
            )
          ]

      ),
      body:StreamBuilder(
          stream: Firestore.instance.collection('learners').where('contacts', arrayContains: document['mobile']).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else if(snapshot.connectionState == "waiting")
              return Text('Loading');
            else if (!snapshot.hasData) return Text('Loading....');
            else
              return ListView.separated(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  print("the length is blue to: ${snapshot.data.documents.length}");
                  return ListChildren(context, snapshot.data.documents[index]);

                },
                separatorBuilder: (BuildContext context , int index) => const Divider(),
              );



          }
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.person_add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AddChild(document);
              }
          );
        },
      ),
    );
  }
}

Widget ListChildren(BuildContext context, DocumentSnapshot document){
  return  Card(
    child:ListTile(
      leading: Icon(Icons.person,color: Colors.redAccent,),
      title: Text(
        '${document['sname']} ${document['oname']}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          fontFamily: 'Roboto',
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
      onTap: () {
        // do something
        Navigator.push(context, BouncyPageRoute(widget: ChildSubjects()));
//                    Navigator.of(context).pushNamed('/subject');
      },
    ),
  );
}
