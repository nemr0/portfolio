class Link{
  final  String icon;
  final String link;

  Link({required this.icon, required this.link});
  factory Link.fromMap(Map<String,dynamic> data){
    return Link(icon: data['icon'], link: data['link']);
  }
}