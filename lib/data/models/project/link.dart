import 'package:equatable/equatable.dart';

class Link extends Equatable{
  final  String icon;
  final String link;

  const Link({required this.icon, required this.link});
  factory Link.fromMap(dynamic data){
    return Link(icon: data['icon'], link: data['link']);
  }

  @override
  List<Object?> get props => [icon,link];
}