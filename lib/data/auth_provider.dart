import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/data/auth_helper.dart';
import 'package:flutter_application_1/data/firestore_helper.dart';
import 'package:flutter_application_1/screens/user.dart';



class AuthProvider {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  signUp() async{
    UserCredential? userCredential = await AuthHelper.authHelper.signUp(
      emailController.text, passwordController.text);
     UserApp userApp = UserApp (
      email :emailController.text ,
     fullName : fullNameController.text,
     userName : userNameController.text,
     uId: userCredential!.user!.uid);
     FireStoreHelper.fireStoreHelper.addUserToFireStor(userApp);



     }


}