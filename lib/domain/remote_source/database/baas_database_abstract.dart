import 'package:portfolio/data/models/contact/contact.dart' show Contact;
import 'package:portfolio/data/models/experience/experience.dart';
import 'package:portfolio/data/models/project/project.dart';

abstract class BAASService{
  const BAASService();
  Future<void> init()async{}
  Future<void> addContact({required Contact contact});
  Future<List<ExperienceItem>> getExperienceItems();
  Future<List<Project>> getProjects();
  }