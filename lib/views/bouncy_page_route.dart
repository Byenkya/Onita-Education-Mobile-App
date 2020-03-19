import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:onita_app/o_level_caricular.dart';

class BouncyPageRoute extends PageRouteBuilder{
  final Widget widget;

  BouncyPageRoute({this.widget})
    : super(
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (BuildContext context,
    Animation<double> animation,
    Animation<double> secAnimation, Widget child){
      animation = CurvedAnimation(parent: animation, curve: Curves.ease);

      return ScaleTransition(
        alignment: Alignment.center,
        scale: animation,
        child: child,
      );
    },
    pageBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secAnimation){
      return widget;
    },
    settings: RouteSettings(
      arguments: Document
    )
  );
}

class BouncyPageRouteData extends PageRouteBuilder{
  final Widget widget;
  List<Document> list_docs;

  BouncyPageRouteData(this.widget, this.list_docs)
      : super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation, Widget child){
        animation = CurvedAnimation(parent: animation, curve: Curves.ease);

        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation){
        return widget;
      },
      settings: RouteSettings(
          arguments: list_docs
      )
  );
}

class BouncyPageRouteDoc extends PageRouteBuilder{
  final Widget widget;
  Document document;

  BouncyPageRouteDoc(this.widget, this.document)
      : super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation, Widget child){
        animation = CurvedAnimation(parent: animation, curve: Curves.ease);

        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation){
        return widget;
      },
      settings: RouteSettings(
          arguments: document
      )
  );
}

class BouncyPageRouteSnap extends PageRouteBuilder{
  final Widget widget;
  DocumentSnapshot document;

  BouncyPageRouteSnap(this.widget, this.document)
      : super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation, Widget child){
        animation = CurvedAnimation(parent: animation, curve: Curves.ease);

        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation){
        return widget;
      },
      settings: RouteSettings(
          arguments: document
      )
  );
}
