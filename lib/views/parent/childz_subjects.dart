import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onita_app/views/parent/child_info.dart';
import 'package:onita_app/views/parent/subject.dart';
import 'package:onita_app/views/bouncy_page_route.dart';

class ChildSubjects extends StatefulWidget {
  @override
  _ChildSubjectsState createState() => _ChildSubjectsState();
}

class _ChildSubjectsState extends State<ChildSubjects> {
  final List<String> subjects = <String>["Math","English","Biology",'Physics'];
  Color _red = Colors.red;
  Color _white = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
            'SUBJECTS',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              fontFamily: 'Roboto',
              color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline,color: _white,),
            onPressed: (){
              showDialog(
                  context: context,
                builder: (BuildContext context){
                    return ChildInfo();
                }
              );
              },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: subjects.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child:ListTile(
                  leading: Icon(Icons.label,color: Colors.redAccent,),
                  title: Text(
                      '${subjects[index]}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
                  onTap: () {
                    // do something
                    Navigator.push(context, BouncyPageRoute(widget: Subject()));
//                    Navigator.of(context).pushNamed('/subject');
                  },
                ),
              );
            }
        ) ,
      ),
    );
  }
}