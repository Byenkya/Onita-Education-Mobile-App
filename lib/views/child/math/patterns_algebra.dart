import 'package:flutter/material.dart';

class PatternsAlgebra extends StatefulWidget {
  @override
  _PatternsAlgebraState createState() => _PatternsAlgebraState();
}

class _PatternsAlgebraState extends State<PatternsAlgebra> {
  List s1_pa = ['Algebraic Symbols', 'Sequence and Number Patterns', 'Commercial and Household Arithmetic', 'Algebra', 'Equations of Lines and Curves'];
  List s2_pa = ['Algebra: Use of Symbols, Substitution', 'Business Arithmetric', 'Inequalities and Regions', 'Algebra -Expansion and Fractorisation'];
  List s3_pa = ['The Equation of A Straight Line', 'Algebraic Expressions, Equations and Inequalities', 'Quadratic Equations', 'Simultaneous Equations'];
  List s4_pa = ['Composite Function', 'Equations and Inequalities', 'Linear Programming', 'Algebra'];
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
                    itemCount: s1_pa.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child:ListTile(
                          leading: Icon(Icons.assignment,color: Colors.redAccent,),
                          title: Text(
                            '${s1_pa[index]}',
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
