import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/user.dart';


class FireStoreHelper{
   
  FireStoreHelper._();
 static FireStoreHelper fireStoreHelper = FireStoreHelper._();

  

  FirebaseFirestore firestore = FirebaseFirestore.instance;
//تم عمل كولكشن للمستخدييمن وهو يلي حستخدمه عند استخدام المثود اللازمة للتخزين 
CollectionReference <Map<String,dynamic>> usersCollection = FirebaseFirestore.instance.collection('users');

  addUserToFireStor  (UserApp user) async{
    //userCollection هو الريفرنس في الفيرستور عن الكولكشن الخاص بالمستخدمين ومن خلاله بقدر أستخدم دالات اضافة المستخدمين الجدد 
    //كل مستخدم جديد عبارة عن دوكيومينك , لهيك لما أسترجع باينات المستخدمين بسترجعها على شكل دوكيومينت سنابشوت
   await  usersCollection.doc(user.uId).set(user.toMap());
  }

 Future<UserApp> getUserFromFireStor(String userId ) async{
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = 
    await usersCollection.doc(userId).get();
    Map<String,dynamic>? dataMap = documentSnapshot.data();
     return UserApp.fromMap(dataMap!); 
    
  }

}