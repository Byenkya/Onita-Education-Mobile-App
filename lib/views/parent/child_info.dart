import 'package:flutter/material.dart';

class ChildInfo extends StatefulWidget {
  @override
  _ChildInfoState createState() => _ChildInfoState();
}

class _ChildInfoState extends State<ChildInfo> {
  Color _blue = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 350.0,
        width: 800.0,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Child's Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                    )
                ),
                DataTable(
                  columns: [
                    DataColumn(label: Text("")),
                    DataColumn(label: Text(""))
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text(
                            "First Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              fontFamily: 'Roboto',
                            )
                        )),
                        DataCell(
                            Text(
                                "Joshua",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                )
                            ),
                            showEditIcon: true,
                        )
                      ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text(
                            "Surname Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              fontFamily: 'Roboto',
                            )
                        )),
                        DataCell(Text(
                            "Byenkya",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              fontFamily: 'Roboto',
                            )
                        ),
                            showEditIcon: true
                        )
                     ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text(
                            "Date of Birth",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              fontFamily: 'Roboto',
                            ),
                        )),
                        DataCell(Text(
                            "2019/01/18",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              fontFamily: 'Roboto',
                            )
                        ),
                            showEditIcon: true,onTap: (){print("chelsea fc for life");})
                      ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "School",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                )
                            )),
                        DataCell(Text(
                            "Seroma Christian High School",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              fontFamily: 'Roboto',
                            )
                        ),
                            showEditIcon: true
                        )
                      ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                            Text(
                                "Class",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.0,
                                  fontFamily: 'Roboto',
                                )
                            )
                        ),
                        DataCell(Text(
                            "Senior 3",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              fontFamily: 'Roboto',
                            )
                        ),
                            showEditIcon: true
                        )
                      ]
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
