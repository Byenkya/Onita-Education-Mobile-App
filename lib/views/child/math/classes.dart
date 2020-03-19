import 'package:flutter/material.dart';
import 'package:onita_app/o_level_caricular.dart';
import 'package:onita_app/views/bouncy_page_route.dart';
import 'package:onita_app/views/child/math/question.dart';

class Classes extends StatefulWidget {
  final int level;
  Classes(this.level);
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  @override
  Widget build(BuildContext context) {
    List numbers = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            'Mathematics',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sub Topics'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: findTopics(widget.level).length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child:ListTile(
                          leading: Icon(Icons.assignment,color: Colors.redAccent,),
                          title: Text(
                            '${findTopics(widget.level)[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
                          onTap: () {
                            print(index);
                            if (widget.level == 1){
                              if(index == 0){
                                find_documents(numbers, 'S1NUT1', context);
                              }else if(index == 1){
                                find_documents(numbers, 'S1NUT2', context);
                              }else if(index == 2){
                                find_documents(numbers, 'S1NUT3', context);
                              }else if(index == 3){
                                find_documents(numbers, 'S1NUT4', context);
                              }else if(index == 4){
                                find_documents(numbers, 'S1NUT5', context);
                              }else if(index == 5){
                                find_documents(numbers, 'S1NUT13', context);
                              }

                            }else if(widget.level == 2){
                              if(index == 0){
                                find_documents(numbers, 'S2NUT3', context);
                              }else if(index == 1){
                                find_documents(numbers, 'S2NUT8', context);
                              }else if(index == 2){
                                find_documents(numbers, 'S2NUT11', context);
                              }else if(index == 3){
                                find_documents(numbers, 'S2NUT17', context);
                              }
                            }else if(widget.level == 3){
                              if(index == 0){
                                find_documents(numbers, 'S3NUT1', context);
                              }else if(index == 1){
                                find_documents(numbers, 'S3NUT6', context);
                              }else if(index == 2){
                                find_documents(numbers, 'S3NUT7', context);
                              }else if(index == 3){
                                find_documents(numbers, 'S3NUT8', context);
                              }
                            }
                          },
                        ),
                      );
                    }
                )
              ],
            ),
          ),
        )
    );
  }
}

find_documents(List<Document> documents, String search_term, BuildContext context){
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
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  List docs = <Document>[];
  for(int i=0; i < documents.length; i++){
    if(documents[i].topic[0] == search_term){
      docs.add(documents[i]);
    }
  }
  if(docs.length == 0){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
              title: Text('Alert'),
              content: Text(
                'No questions yet!!.',
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
    Navigator.push(context, BouncyPageRouteData(Question(search_term), docs));
  }

}

findTopics(int level){
  if (level == 1){
    List s1_numbers = ['Sets', 'Number Bases', 'Numerical Concepts I', 'Numerical Concepts II', 'Fractions and Percentages', 'Approximation and Estimation'];
    return s1_numbers;
  }else if(level == 2){
    List s2_numbers = ['Numerical Concepts', 'Indices and Logarithms', 'Ratio and Proportion', 'Numerical Concepts-Indices, Standard Form, Computation and Surds'];
    return s2_numbers;
  }else if(level == 3){
    List s3_numbers = ['Set Theory', 'Proportion', 'Business Mathematics', 'Matrices'];
    return s3_numbers;
  }


}
