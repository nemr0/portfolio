import 'package:equatable/equatable.dart';
const String questionIconData ='0xec7a';
class Link extends Equatable{
  final  String icon;
  final String link;
  final String tooltip;
  const Link(  {required this.icon, required this.link,required this.tooltip,});
  factory Link.fromMap(dynamic data){
    return Link(icon: data['icon']??questionIconData, link: data['link']??'', tooltip: data['tooltip']??'');
  }

  @override
  List<Object?> get props => [icon,link,tooltip];
}