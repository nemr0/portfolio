
import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:portfolio/data/models/contact/contact.dart';
import 'package:portfolio/data/models/experience/experience.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';

import '../../../../data/models/project/link.dart';

class PocketBaseService extends BAASService {
  PocketBaseService({this.baseUrl='https://pb.nemr.dev'});
  final String baseUrl;
  late final _pb = PocketBase(baseUrl);
  Uri getFileURl(RecordModel record,String filename){
   return _pb.files.getURL(record, filename);
  }

  @override
  addContact({required Contact contact}) async {
    await _pb
        .collection('contact_forms')
        .create(body: contact.toMap())
        .then((value) {
      if (kDebugMode) print(value.data);
    }).catchError((e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    });
  }

  @override
  Future<List<ExperienceItem>> getExperienceItems() async {
    try {
      final collectionList = await _pb.collection('experience').getFullList();
      if (kDebugMode) {
        print(collectionList);
      }

      return List.generate(collectionList.length,
          (i) => ExperienceItem.fromMap(collectionList[i].data));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      rethrow;
    }
  }

  @override
  Future<List<Project>> getProjects() async {
    try {
      List<Project> projects = [];
      var collectionList = await _pb.collection('projects').getFullList();
      for(RecordModel collection in collectionList){
       List<Link> linksRecords = [];
       for(String link in collection.getListValue('links')){
         final linkRecord =await _pb.collection('links').getOne(link);
         final asset = await _pb.collection('assets').getOne(linkRecord.get('icon'));

         linksRecords.add(Link.fromRecord(linkRecord,_pb.files.getURL(asset, asset.get('asset'),download: true).toString(),));
       }
       final photosL =collection.getListValue('photos');
       final photos = List.generate(photosL.length,(e)=>_pb.files.getURL(collection, photosL[e]).toString());
       projects.add(Project.fromRecord(collection,links: linksRecords,cover: _pb.files.getURL(collection,collection.getStringValue('cover')).toString(), photos: photos));

      }
      return projects;

      // print('here: ${collectionList[0].data}');
      // print('here: ${collectionList[0].get('links').first.runtimeType}');
      // return List.generate(collectionList.length,
      //     (i) => Project.fromRecord(collectionList[i]));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      rethrow;
    }
  }
}
