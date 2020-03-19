import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:onita_app/o_level_caricular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Solution extends StatelessWidget {
  final String topic;
  Solution(this.topic);
  @override
  Widget build(BuildContext context) {
    Document document = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Solution'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Question',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  color: Colors.black
              ),
            ),
            TeXView(
              teXHTML: checkDataTypeQuestion(document),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Solutions',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  color: Colors.black
              ),
            ),
            TeXView(
                teXHTML: checkDataTypeSolution(document),
                renderingEngine: RenderingEngine.Katex
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.list_view,
        backgroundColor: Colors.redAccent,
        overlayOpacity: 0.1,
        animatedIconTheme: IconThemeData.fallback(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.assignment_turned_in),
            backgroundColor: Colors.redAccent,
            label: '0 %',
            labelStyle: TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold, color: Colors.redAccent),
            onTap: (){print('0 % ${topic}');}
          ),
          SpeedDialChild(
              child: Icon(Icons.assignment_turned_in),
              backgroundColor: Colors.redAccent,
              label: '25 %',
              labelStyle: TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold, color: Colors.redAccent),
              onTap: (){print('25 %');}
          ),
          SpeedDialChild(
              child: Icon(Icons.assignment_turned_in),
              backgroundColor: Colors.redAccent,
              label: '50 %',
              labelStyle: TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold, color: Colors.redAccent),
              onTap: (){print('50 %');}
          ),
          SpeedDialChild(
              child: Icon(Icons.assignment_turned_in),
              backgroundColor: Colors.redAccent,
              label: '75 %',
              labelStyle: TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold, color: Colors.redAccent),
              onTap: (){print('75 %');}
          ),
          SpeedDialChild(
              child: Icon(Icons.assignment_turned_in),
              backgroundColor: Colors.redAccent,
              label: '100 %',
              labelStyle: TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold, color: Colors.redAccent),
              onTap: (){print('100 %');}
          )
        ],
      ),
    );
  }
}

checkDataTypeSolution(Document document){
  String answer = '';
  if (document.answer['text'] is String){
    return document.answer['text'];
  }else{
    List<dynamic>ans = document.answer['text'];
    for(int i=0; i < ans.length; i++){
      if(ans[i] is String){
        answer += ans[i].toString() + '\n';
      }else{
        answer += ans[i]['method1'].toString() + '\n';
      }

    }
    return answer;
  }
}

checkDataTypeQuestion(Document document){
  String question = '';
  if(document.question['text'] is String){
    return document.question['text'];
  }else{
    List <dynamic>body = document.question['text']['body'];
    for(int i=0; i < body.length; i++){
      question += body[i] + '\n';
    }
    return document.question['text']['intro'].toString() + '\n' + question + document.question['text']['ending'].toString() ;
  }
}

