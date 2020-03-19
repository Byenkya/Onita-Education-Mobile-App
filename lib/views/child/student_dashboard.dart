import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onita_app/o_level_caricular.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:onita_app/views/child/subject_details.dart';
import 'package:onita_app/views/bouncy_page_route.dart';
import 'package:onita_app/views/child/math/mathematics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashBoard extends StatefulWidget {
  final DocumentSnapshot document;
  const DashBoard(this.document);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List subjects = ["Mathematics", "Chemistry","Physics","Biology"];
  List docs  = <Document>[];
  Future<List<DocumentSnapshot>> getData() async{
    var data = await Firestore.instance.collection('sonitamob').where('level', isEqualTo: widget.document['current_level']).getDocuments();
    print("Data length: ${data.documents.length}");
    for(int i=0; i < data.documents.length; i++){
      Document document = Document(
          data.documents[i]['answer'],
          data.documents[i]['bloom'],
          data.documents[i]['certificate'],
          data.documents[i]['examiner'],
          data.documents[i]['index'],
          data.documents[i]['level'],
          data.documents[i]['mark'],
          data.documents[i]['number'],
          data.documents[i]['paperCode'],
          data.documents[i]['paperName'],
          data.documents[i]['paperType'],
          data.documents[i]['question'],
          data.documents[i]['section'],
          data.documents[i]['term'],
          data.documents[i]['time'],
          data.documents[i]['topic'],
          data.documents[i]['uid'],
          data.documents[i]['year'],
          data.documents[i]['steps']
      );
      docs.add(document);
    }
    print("Docs length: ${docs.length}");
    return data.documents;
  }

  @override
  void initState(){
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dash Board',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: (){},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'My Subjects',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:15),
              ),
              ListView.builder(
                itemCount: subjects.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(0,0),
                          blurRadius: 5,
                        )
                      ]
                    ),
                    child: InkWell(
                      onTap: (){
                        List clz = <Document>[];
                        if (index == 0){
                          for(int i =0;i < docs.length; i++){
                            clz.add(docs[i]);
                          }
                          print("Clz length: ${clz.length}");
                          Navigator.push(context, BouncyPageRouteData(Math(widget.document['current_level']), clz));
                        }

                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  subjects[index].toString().toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Divider(
                                  color: Colors.redAccent,
                                  height: 5,
                                ),
                                SizedBox(height: 10.0,),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: LinearPercentIndicator(
                                          animation: true,
                                          lineHeight: 5.0,
                                          animationDuration: 2500,
                                          percent: 0.5,
                                          backgroundColor: Colors.white,
                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                          progressColor: Colors.redAccent,
                                        ),
                                      )
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          '50 %',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          )
                        ],
                      )
                    ),
                  );
                },
              )
            ],
          ),

        ),
      ),
    );
  }
}
