import 'package:equatable/equatable.dart';
import 'package:portfolio_shared/data/models/project/link.dart';
class Project extends Equatable{
  final List<String> photos;
  final List<Link> links;
  final String description;
  final String name;
  final String cover;
  const Project(
      {required this.photos,required this.cover,
        required this.links,
      required this.description,
      required this.name});

  factory Project.fromMap(Map<String,dynamic> data)
      => Project(
            photos: List<String>.from(data['photos']),
            cover: data['cover']??'',
            links: (data['links'] as List).map((e) => Link.fromMap(e as Map<String, dynamic>)).toList(),
            description: data['description']??'',
            name: data['name']??'');


  @override
  List<Object?> get props => [photos,links,description,name,cover];
}
