import 'package:flutter/material.dart';

class DataProb extends StatefulWidget {
  @override
  _DataProbState createState() => _DataProbState();
}

class _DataProbState extends State<DataProb> {
  List s1_dp = ['Grap Plotting and Drawing', 'Statics I (Collection and Representation of Data)'];
  List s2_dp = ['Statistics (Mode, Mean and Median)'];
  List s3_dp = ['Data Collection/Display', 'Probability'];
  @override
  Widget build(BuildContext context) {
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
                    itemCount: s1_dp.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child:ListTile(
                          leading: Icon(Icons.assignment,color: Colors.redAccent,),
                          title: Text(
                            '${s1_dp[index]}',
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
