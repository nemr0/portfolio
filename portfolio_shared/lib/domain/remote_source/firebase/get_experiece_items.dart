
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio_shared/data/models/exceptions/network_exception.dart';
import 'package:portfolio_shared/data/models/exceptions/parse_exception.dart';
import 'package:portfolio_shared/data/models/exceptions/server_error.dart';
import 'package:portfolio_shared/data/models/experience/experience.dart';

Future<List<ExperienceItem>> getExperienceItemsFromFirebase() async {


    try {
      QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
          .collection('experience')
          .orderBy('order')
          .get();
     if(kDebugMode) print(data);
      if (data.docs.isEmpty && data.metadata.isFromCache) {
        throw NetworkException(
          endpoint: 'projects',
        );
      }
      return List<ExperienceItem>.generate(
          data.docs.length, (index) => ExperienceItem.fromMap(data.docs[index].data()));
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