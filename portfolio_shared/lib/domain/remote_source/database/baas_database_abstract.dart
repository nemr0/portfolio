import 'package:portfolio_shared/data/models/contact/contact.dart' show Contact;
import 'package:portfolio_shared/data/models/experience/experience.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

abstract class BAASService{
  Future<void> init()async {
    throw UnimplementedError();
  }
  addContact({required Contact contact}){
    throw UnimplementedError();
  }
  Future<void> addProject(Project project);
  Future<List<ExperienceItem>> getExperienceItems();
  Future<List<Project>> getProjects();
  }