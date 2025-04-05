import 'package:portfolio/data/models/project/project.dart';

abstract class LocalDatabase{
  /// initializes the local database.
  Future<void> init() async {}
  /// Abstract class representing a local database service.
  List<Project>? getProjects();
  /// Retrieves a list of projects from the local database.
  Future<void> saveProjects(List<Project> projects);
}