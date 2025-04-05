import 'package:portfolio/data/models/contact/contact.dart' show Contact;
import 'package:portfolio/data/models/project/project.dart';

/// Abstract class representing a Backend-as-a-Service (BAAS) service.
/// This class provides methods to initialize the service, add a contact,
/// retrieve experience items, and retrieve projects.
abstract class BAASService {
  /// Constructor for the BAASService class.
  const BAASService();

  /// Initializes the BAAS service.
  /// This method should be called before using any other methods of the service.
  Future<void> init() async {}

  /// Adds a contact to the BAAS service.
  ///
  /// \param contact The contact to be added. This parameter is required.
  Future<void> addContact({required Contact contact});

  /// Retrieves a list of projects from the BAAS service.
  ///
  /// \returns A Future that resolves to a list of [Project] objects.
  Future<List<Project>> getProjects();
}