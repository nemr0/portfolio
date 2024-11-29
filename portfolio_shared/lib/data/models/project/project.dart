import 'package:equatable/equatable.dart';
import 'package:portfolio_shared/data/models/project/link.dart';
class Project extends Equatable{
  final List<String> photos;
  final List<Link> links;
  final String description;
  final String shortDescription;
  final String name;
  final String cover;
  final String order;
  const Project(
      {required this.photos,required this.cover,required this.order,
        required this.links,required this.shortDescription,
        required this.description,
      required this.name});

  factory Project.fromMap(Map<String,dynamic> data)

          {
      return Project(
          photos: data['photos'] == null ? [] : List<String>.from(data['photos']),
          cover: data['cover'] ?? '',
          shortDescription: data['short_description'] ?? '',
          links: ((data['links'] ?? []) as List)
              .map((e) => Link.fromMap(e as Map<String, dynamic>))
              .toList(),
          description: data['description'],
          name: data['name'] ?? '',
          order: ((data['order']) ?? '1000').toString());

  }

  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'photos':photos,
      'description':description,
      'short_description':shortDescription,
      'cover':cover,
      'links': List.from(links.map<Map<String,dynamic>>((e)=>e.toMap())),
      'order' : order,
    };
  }
  @override
  List<Object?> get props => [photos,links,description,name,cover];
}
