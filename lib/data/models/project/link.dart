import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';
class Link extends Equatable{
  final  String icon;
  final String link;
  final String tooltip;
  const Link(  {required this.icon, required this.link,required this.tooltip,});
  // factory Link.fromMap(dynamic data){
  //   return Link(icon: data['icon']??questionIconData, link: data['link']??'', tooltip: data['tooltip']??'');
  // }
  factory Link.fromMap(Map<String,dynamic> data){
    return Link(icon: data['icon']??'', link: data['link']??'', tooltip: data['tooltip']??'');
  }
  factory Link.fromRecord(RecordModel record,String icon){
    return Link(icon: icon, link: record.get('link'), tooltip: record.get('tooltip')??'');
  }

  Map<String,dynamic> toMap(){
    return{
      'link':link,
      'icon':icon,
      'tooltip':tooltip,

    };
  }
  @override
  List<Object?> get props => [icon,link,tooltip];
}

const Link emptyLink = Link(icon: 'https://pb.nemr.dev/api/files/pbc_1321337024/m9ycg722x4u6fpk/app_store_o1kmltbrz6.webp?token=', link: '', tooltip: '');