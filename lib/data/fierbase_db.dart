import 'package:firebase_database/firebase_database.dart';
class FierbaseDB { 
  FierbaseDB ._();
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();


}