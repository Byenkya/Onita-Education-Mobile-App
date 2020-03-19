import 'package:flutter/material.dart';
import 'package:onita_app/o_level_caricular.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:onita_app/views/child/math/solution.dart';
import 'package:onita_app/views/bouncy_page_route.dart';

class Question extends StatelessWidget {
  final String topic;
  Question(this.topic);
  @override
  Widget build(BuildContext context) {
    List sets = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Questions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: sets.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Examiner: ${sets[index].examiner}, Year: ${sets[index].year}"),
                    TeXView(
                      teXHTML: checkDataTypeQuestion(sets[index]),
                        renderingEngine: RenderingEngine.MathJax

                    ),
                    FlatButton.icon(
                        onPressed: (){
                          Navigator.push(context, BouncyPageRouteDoc(Solution(topic), sets[index]));
                        },
                        icon: Icon(Icons.question_answer, color: Colors.white,),
                        label: Text(
                            'View Answer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            color: Colors.white
                        ),
                        ),
                      color: Colors.redAccent,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
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
