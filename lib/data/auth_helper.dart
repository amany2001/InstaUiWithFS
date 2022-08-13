import 'package:firebase_auth/firebase_auth.dart';
class AuthHelper {
AuthHelper._();
static AuthHelper authHelper = AuthHelper._();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

 Future<UserCredential?> signIn(String emailAddress , String password) async{
  try {
  final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
  return userCredential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  
} 
 Future<UserCredential?> signUp(String emailAddress , String password) async{
  try {
  final  UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  ) ;
  return   userCredential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}
signOut() async{
  await FirebaseAuth.instance.signOut();
}
forgetPassword() async{}


}