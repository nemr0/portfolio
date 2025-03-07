import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:portfolio_shared/data/models/contact/contact.dart';
import 'package:portfolio_shared/data/models/experience/experience.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:portfolio_shared/domain/remote_source/database/baas_database_abstract.dart';

class PocketBaseService extends BAASService {
  final _pb = PocketBase('https://pb.nemr.dev');

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
  Future<void> addProject(Project project) async {
    // await _pb.collection('projects').create(body: {});
  }

  @override
  Future<List<ExperienceItem>> getExperienceItems() async {
    try {
      final collectionList = await _pb.collection('experience').getFullList();
      print(collectionList);
      return List.generate(collectionList.length,
          (i) => ExperienceItem.fromMap(collectionList[i].data));
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }

  @override
  Future<List<Project>> getProjects() async {
    try {
      final collectionList = await _pb.collection('projects').getFullList();
      print(collectionList);
      return List.generate(collectionList.length,
          (i) => Project.fromMap(collectionList[i].data));
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }
}
