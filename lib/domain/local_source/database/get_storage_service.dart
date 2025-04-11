import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get_storage/get_storage.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:portfolio/domain/local_source/local_database_abstract.dart';

class GetStorageService extends LocalDatabase {
  GetStorage? _storage;

  @override
  Future<void> init() async {
    try{
      if (_storage == null) {
        await GetStorage.init();
        _storage = GetStorage();
      }
    }catch(e,s){
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
    return super.init();
  }

  @override
  List<Project>? getProjects() {
    try {
      final projects = _storage?.read<List>('projects');
      if (projects == null) return null;
      return (projects).map((e) => Project.fromMap(e)).toList();
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      return null;
    }
  }

  @override
  Future<void> saveProjects(List<Project> projects) async {
    try{
      return await _storage?.write(
        'projects',
        projects.map((e) => e.toMap()).toList(),
      );
    }catch(e, s){
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
  }

  @override
  bool getDidContact() {
    try {
      return _storage?.read<bool>('didContact') ?? false;
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      return false;
    }
  }

  @override
  Future<void> setDidContact(bool didContact) async {
    try{
      return _storage?.write('didContact', didContact);
    }catch(e, s){
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
  }
}
