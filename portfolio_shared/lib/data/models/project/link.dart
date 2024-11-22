import 'package:equatable/equatable.dart';

class Link extends Equatable{
  final  int ionicon;
  final String link;

  const Link({required this.ionicon, required this.link});
  factory Link.fromMap(dynamic data){
    return Link(ionicon: int.tryParse(data['icon'])??0xec7a, link: data['link']);
  }

  @override
  List<Object?> get props => [ionicon,link];
}