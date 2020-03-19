import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:onita_app/views/child/math/classes.dart';
import 'package:onita_app/views/bouncy_page_route.dart';
import 'package:onita_app/o_level_caricular.dart';
import 'package:onita_app/views/child/math/geometry_measures.dart';
import 'package:onita_app/views/child/math/data_prob.dart';
import 'package:onita_app/views/child/math/patterns_algebra.dart';

class Math extends StatefulWidget {
  final int level;
  Math(this.level);
  @override
  _MathState createState() => _MathState();
}

class _MathState extends State<Math> {
  List topics = ['Number', 'Geometry and Measures', 'Data and Probability', 'Patterns and Algebra', 'Mock Exam'];
  @override
  Widget build(BuildContext context) {
    List clz = ModalRoute.of(context).settings.arguments;
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
                  'Topics'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: topics.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child:ListTile(
                          leading: Icon(Icons.label,color: Colors.redAccent,),
                          title: Text(
                            '${topics[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
                          onTap: () {
                            if(index == 0){
                              List num = <Document>[];
                              for(int i=0; i < clz.length; i++){
                                if(clz[i].topic[0] == 'S1NUT1' || clz[i].topic[0] == 'S1NUT2' || clz[i].topic[0] == 'S1NUT3' ||
                                    clz[i].topic[0] == 'S1NUT4' || clz[i].topic[0] == 'S1NUT5' || clz[i].topic[0] == 'S1NUT13'){
                                  num.add(clz[i]);
                                }else if(clz[i].topic[0] == 'S2NUT3' || clz[i].topic[0] == 'S2NUT8' || clz[i].topic[0] == 'S2NUT11' || clz[i].topic[0] == 'S2NUT17'){
                                  num.add(clz[i]);
                                }else if(clz[i].topic[0] == 'S3NUT1' || clz[i].topic[0] == 'S3NUT6' || clz[i].topic[0] == 'S3NUT7' || clz[i].topic[0] == 'S3NUT8'){
                                  num.add(clz[i]);
                                }
                              }
                              print("num length is ${num.length}");
                              Navigator.push(context, BouncyPageRouteData(Classes(widget.level), num));
                            }else if(index == 1){
                              Navigator.push(context, BouncyPageRoute(widget: GeometryMeasures()));
                            }else if(index == 2){
                              Navigator.push(context, BouncyPageRoute(widget: DataProb()));
                            }else if(index == 3){
                              Navigator.push(context, BouncyPageRoute(widget: PatternsAlgebra()));
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

