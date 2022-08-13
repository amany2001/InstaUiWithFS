import 'package:flutter/cupertino.dart';

class UserApp {
  String? uId;
  String email ;
 String? password ;
 String fullName ;
 String userName ;

 UserApp({
  this.uId,
  required this.email,
  this.password,
  required this.fullName,
  required this.userName
 });
 Map<String , dynamic> toMap(){
  return{
    'email' : email,
    'fullName' :fullName,
    'userName' :userName,
  };
  
 }

  factory UserApp.fromMap(Map<String,dynamic> map){
  return UserApp(
  email : map['email'] ?? '',
    fullName: map['fullName'] ?? '',
    userName: map['userName'] ?? '',
  );


 }


 
}


