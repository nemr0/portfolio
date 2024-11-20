import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/data/models/exceptions/network_exception.dart';
import 'package:portfolio/data/models/exceptions/parse_exception.dart';
import 'package:portfolio/data/models/exceptions/server_error.dart';
import 'package:portfolio/data/models/project/project.dart';

Future<List<Project>> getProjectsFromFirebase() async {
  try {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('projects')
        .orderBy('order')
        .get();
    print(data);
    if (data.docs.isEmpty && data.metadata.isFromCache) {
      throw NetworkException(
        endpoint: 'projects',
      );
    }
    return List.generate(
        data.docs.length, (index) => Project.fromMap(data.docs[index].data()));
  } catch (e, s) {
    if (e is FirebaseException) {
      throw ServerException(endpoint: 'projects', stackTrace: s, error: e.code, message: e.message);
    } else {
      throw ParseException(stackTrace: s);
    }
  }
}
