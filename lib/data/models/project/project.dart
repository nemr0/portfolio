import 'package:portfolio/data/models/project/link.dart';

class Project {
  final List<String> photos;
  final List<Link> links;
  final String description;
  final String name;

  Project(
      {required this.photos,
      required this.links,
      required this.description,
      required this.name});

  factory Project.fromMap(Map<String, dynamic> data) => Project(
      photos: data['photos'],
      links: List.generate(
          data['links'].length, (index) => Link.fromMap(data['links'][index])),
      description: data['description'],
      name: data['name']);
}
