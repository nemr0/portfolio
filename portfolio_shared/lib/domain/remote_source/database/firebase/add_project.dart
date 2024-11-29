import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio_shared/data/models/exceptions/parse_exception.dart';
import 'package:portfolio_shared/data/models/exceptions/server_error.dart';
import 'package:portfolio_shared/data/models/project/project.dart';


Future<void> addProject(Project project)async {
 try {
    FirebaseFirestore.instance
        .collection('projects')
        .doc(project.order.toString())
        .set(project.toMap());
  } catch (e, s) {
  if(kDebugMode) {
  print(e);
  print(s);
  }
  if (e is FirebaseException) {


  throw ServerException(endpoint: 'projects', stackTrace: e.stackTrace, error: e.code, message: e.message);
  } else {
  throw ParseException(stackTrace: s);
  }
  }
}