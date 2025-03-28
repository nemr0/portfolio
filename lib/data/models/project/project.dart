
import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:portfolio/data/models/project/link.dart';

final Project emptyProject = Project(
    photos: List.generate(3, (_)=>'https://pb.nemr.dev/api/files/pbc_1321337024/m9ycg722x4u6fpk/app_store_o1kmltbrz6.webp?token='),
    cover: 'https://pb.nemr.dev/api/files/pbc_1321337024/m9ycg722x4u6fpk/app_store_o1kmltbrz6.webp?token=',
    links: List.generate(2, (_) => emptyLink),
    shortDescription: 'this is a ten words short description, lovely, beautiful and cute one',
    description: 'hi short description here',
    name: 'three word name');

class Project extends Equatable {
  final List<String> photos;
  final List<Link> links;
  final String description;
  final String shortDescription;
  final String name;
  final String cover;

  const Project(
      {required this.photos,
      required this.cover,
      required this.links,
      required this.shortDescription,
      required this.description,
      required this.name});

  factory Project.fromRecord(RecordModel record,
      {required List<Link> links, required String cover, required List<String> photos}) {
    return Project(
        photos:  photos,
        cover: cover,
        shortDescription: record.getStringValue('short_description'),
        links: links,
        description: record.get('description'),
        name: record.getStringValue('name'),);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photos': photos,
      'description': description,
      'short_description': shortDescription,
      'cover': cover,
      'links': List.from(links.map<Map<String, dynamic>>((e) => e.toMap())),
    };
  }
  String get path =>name.toLowerCase().replaceAll(' ', '-');
  @override
  List<Object?> get props => [photos, links, description, name, cover];
}
