import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:portfolio/data/models/contact/contact.dart';
import 'package:portfolio/data/models/exceptions/server_error.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';

import '../../../../data/models/project/link.dart';

/// A service class that interacts with the PocketBase backend.
class PocketBaseService extends BAASService {
  /// Creates an instance of [PocketBaseService].
  ///
  /// \param baseUrl The base URL of the PocketBase service. Defaults to 'https://pb.nemr.dev'.
  PocketBaseService({this.baseUrl='https://pb.nemr.dev'});

  /// The base URL of the PocketBase service.
  final String baseUrl;

  /// The PocketBase client instance.
  late final _pb = PocketBase(baseUrl);

  /// Retrieves the URL for a file associated with a record.
  ///
  /// \param record The record containing the file.
  /// \param filename The name of the file.
  /// \returns The URL of the file.
  String getFileURl(RecordModel record, String filename) {
    return _pb.files.getURL(record, filename).toString();
  }

  /// Adds a contact to the PocketBase service.
  ///
  /// \param contact The contact to be added. This parameter is required.
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
      throw ServerException(endpoint: 'contact_forms', stackTrace: s,message: e.toString());
    });
  }


  /// Retrieves a list of projects from the PocketBase service.
  ///
  /// \returns A Future that resolves to a list of [Project] objects.
  @override
  Future<List<Project>> getProjects() async {
    try {
      List<Project> projects = [];
      var collectionList = await _pb.collection('projects').getFullList();
      for (RecordModel collection in collectionList) {
        List<Link> linksRecords = [];
        for (String link in collection.getListValue('links')) {
          final linkRecord = await _pb.collection('links').getOne(link);
          final asset = await _pb.collection('assets').getOne(linkRecord.get('icon'));

          linksRecords.add(Link.fromRecord(
            linkRecord,
            getFileURl(asset, asset.get('asset')).toString(),
          ));
        }
        final photosL = collection.getListValue('photos');
        final photos = List.generate(photosL.length, (e) =>getFileURl(collection, photosL[e]));
        projects.add(Project.fromRecord(
          collection,
          links: linksRecords,
          cover: getFileURl(collection, collection.getStringValue('cover')),
          photos: photos,
        ));
      }
      return projects;
    } on ClientException catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      throw ServerException(endpoint: e.url.toString().split('/').last, stackTrace: s,message: e.toString());
    }
  }
}