import'package:portfolio_shared/data/models/project/project.dart';
import'package:portfolio_shared/data/models/project/link.dart';
// final List<String> photos;
// final List<Link> links;
// final String description;
// final String shortDescription;
// final String name;
// final String cover;
extension ProjectToMap on Project{
  Map<String,dynamic> toMap(){
    return{
      'name':name,
      'photos':photos,
      'description':description,
      'shortDescription':shortDescription,
      'cover':cover,
      'links': List.from(links.map((e)=>e.toMap())),

    };
  }
}
extension LinksToMap on Link {
  Map<String,dynamic> toMap(){
    return{
      'link':link,
      'icon':icon,
      'tooltip':tooltip,

    };
  }
}