import 'package:flutter/material.dart';

class GeometryMeasures extends StatefulWidget {
  @override
  _GeometryMeasuresState createState() => _GeometryMeasuresState();
}

class _GeometryMeasuresState extends State<GeometryMeasures> {
  List s1_gm = ['Rectangular Cartesian Coordinates in 2 Dimensions', 'Locus', 'Geometric Construction Skills Training',
    'The Circle (Knowledge of Terms)', 'Bearing', 'General and Angle Properties of Geometric Figures', 'Distance/Time,Speed/Time Graph I', 'Reflection'];

  List s2_gm = ['Mappings and Relations', 'Vectors and Translation I', 'Graphs', 'Similarities and Enlargement', 'The Circle (Symmetry Properties of Circles)', 'Rotation', 'Geometry Length and Area Properties', 'Geometry Nets and Solids'];

  List s3_gm = ['Sine', 'Vectors', 'Circles', 'Bearings', 'Areas and Volumes of Solids', 'Further Transformations'];

  List s4_gm = ['Mappings and Relations', 'Vectors and Translation 1', 'Graphs II', 'Similarities and Enlargement', 'The Circle (Symmetry Properties of Circles)', 'Rotation',
                'Geometry length and Area Properties', 'Geometry Nets and Solids'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    itemCount: s1_gm.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child:ListTile(
                          leading: Icon(Icons.assignment,color: Colors.redAccent,),
                          title: Text(
                            '${s1_gm[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.redAccent,),
                          onTap: () {
//                            Navigator.push(context, BouncyPageRouteData(Question(), sets));
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
