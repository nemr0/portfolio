import 'package:equatable/equatable.dart';

class Contact extends Equatable{
  final String name;
  final String email;
  final String desc;
  final String? phoneNumber;
  final String? company;

  const Contact( {required this.name,required  this.email,required  this.desc, this.phoneNumber, this.company});
  Map<String,dynamic> toMap()=>{
    "name":name,
    "email": email,
    if(company!=null)"company": company,
    if(phoneNumber!=null)"phone": phoneNumber,
    "desc": desc
  };
  @override
  List<Object?> get props => [name,email,desc,phoneNumber,company];
}