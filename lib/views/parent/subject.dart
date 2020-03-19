import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
            'TOPICS',
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
            onSelected: (String result){print(result);},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: "info",
                child: FlatButton.icon(
                    onPressed: (){print('view teacherz info');},
                    icon: Icon(Icons.person_pin, color: Colors.orange,),
                    label: Text("Teacher's Info"),
                  color: Colors.white,
                ),
              ),
              PopupMenuItem(
                value: "add",
                child: FlatButton.icon(
                  onPressed: (){print("Child's progress");},
                  icon: Icon(Icons.book, color: Colors.greenAccent,),
                  label: Text("Child's progress"),
                  color: Colors.white,
                ),
              ),
//              PopupMenuItem(
//                value: "edit",
//                child: FlatButton.icon(
//                    onPressed: (){print('edit teachers info');},
//                    icon: Icon(Icons.edit, color: Colors.blue,),
//                    label: Text("Edit Teacher's info"),
//                  color: Colors.white,
//                ),
//              ),
//              PopupMenuItem(
//                value: "delete",
//                child: FlatButton.icon(
//                  onPressed: (){print('delete teachers info');},
//                  icon: Icon(Icons.delete,color: Colors.red,),
//                  label: Text('Delete Teacher'),
//                  color: Colors.white,
//                ),
//              )
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child:ListTile(
                  leading: Icon(Icons.assignment, color: Colors.redAccent,),
                  title: Text('Topic $index'),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent),
                  onTap: () {
                    // do something
                    print("the index is $index");
                  },
                ),
              );
            }
          ),
        ),
      )
    );
  }
}
