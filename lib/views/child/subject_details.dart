//import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:onita_app/o_level_caricular.dart';
//import 'package:onita_app/views/child/math/mathematics.dart';
//
//Widget _buildListItem(BuildContext context, Document document){
//  return Container(
//    margin: EdgeInsets.only(bottom: 10),
//    decoration: BoxDecoration(
//        color: Colors.grey[300],
//        borderRadius: BorderRadius.circular(10),
//        boxShadow: [
//          BoxShadow(
//            color: Colors.grey[300],
//            offset: Offset(0,0),
//            blurRadius: 5,
//          )
//        ]
//    ),
//    child: ListTile(
//      leading: Container(
//          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
//          child: Text(
//            document.level.toString(),
//            style: TextStyle(
//                color: Colors.redAccent,
//                fontSize: 18,
//                fontWeight: FontWeight.bold
//            ),
//          )
//      ),
//      title: Text(
//        document.topic[0].toString().toUpperCase(),
//        style: TextStyle(
//          fontWeight: FontWeight.bold,
//          fontSize: 18,
//          color: Colors.black,
//        ),
//      ),
//      subtitle: Text(
//        document.question['text'].toString(),
//        style: TextStyle(
//          color: Colors.black,
//          fontSize: 14,
//        ),
//      ),
//      trailing: Icon(Icons.chevron_right, color: Colors.redAccent,),
//      onTap: (){
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => Math(),
//                settings: RouteSettings(
//                  arguments: document,
//                )
//            )
//        );
//      },
//    ),
//  );
//}
//
//class SubjectDetails extends StatefulWidget {
//  @override
//  _SubjectDetailsState createState() => _SubjectDetailsState();
//}
//
//class _SubjectDetailsState extends State<SubjectDetails> {
//  List curricular = ['S1NUT1','S1NUT2','S1NUT3','S1NUT3','S1NUT4','S1NUT5','S1GMT6'];
//  List docs  = <Document>[];
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.redAccent,
//        title: Text(
//            'Subject Details',
//          style: TextStyle(
//            color: Colors.white
//          ),
//        ),
//      ),
//      body: Container(
//        padding: EdgeInsets.all(15),
//        child: SingleChildScrollView(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text(
//                'Subject Topics'.toUpperCase(),
//                style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 22,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//              ListTile(
//                contentPadding: EdgeInsets.all(0),
//                leading: Container(
//                  margin: EdgeInsets.all(8),
//                  padding: EdgeInsets.all(8),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(100),
//                    border: Border.all(width: 1, color: Colors.redAccent),
//                  ),
//                  child: Icon(Icons.person_pin,color: Colors.black,),
//                ),
//                title: Text(
//                  'Olet Charles',
//                  style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 14,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//                subtitle: Text(
//                    'Lead Instructor',
//                    style: TextStyle(
//                      color: Colors.black,
//                      fontSize: 12,
//                    )
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 13),
//              ),
//              StreamBuilder(
//                  stream: Firestore.instance.collection('sonitamob').orderBy('level', descending: false).orderBy('term', descending: false).snapshots(),
//                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//                    if (snapshot.hasError)
//                      return Text('Error: ${snapshot.error}');
//                    else if(snapshot.connectionState == "waiting")
//                      return Text('Loading');
//                    else if (!snapshot.hasData) return Text('Loading....');
//                    else
//                      return ListView.builder(
//                        itemCount: snapshot.data.documents.length,
//                        shrinkWrap: true,
//                        itemBuilder: (BuildContext context, int index){
//                          Document document = Document(
//                            snapshot.data.documents[index]['answer'],
//                            snapshot.data.documents[index]['bloom'],
//                              snapshot.data.documents[index]['certificate'],
//                              snapshot.data.documents[index]['examiner'],
//                              snapshot.data.documents[index]['index'],
//                              snapshot.data.documents[index]['level'],
//                              snapshot.data.documents[index]['mark'],
//                              snapshot.data.documents[index]['number'],
//                              snapshot.data.documents[index]['paperCode'],
//                              snapshot.data.documents[index]['paperName'],
//                              snapshot.data.documents[index]['paperType'],
//                              snapshot.data.documents[index]['question'],
//                              snapshot.data.documents[index]['section'],
//                              snapshot.data.documents[index]['term'],
//                              snapshot.data.documents[index]['time'],
//                              snapshot.data.documents[index]['topic'],
//                              snapshot.data.documents[index]['uid'],
//                              snapshot.data.documents[index]['year'],
//                              snapshot.data.documents[index]['steps']
//                          );
//                          docs.add(document);
//                          return _buildListItem(context, docs[index]);
//
//                        },
//                      );
//
//
//
//                  }
//              ),
//            ],
//          ),
//        ),
//      )
//    );
//  }
//}
