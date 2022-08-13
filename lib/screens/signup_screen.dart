import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/auth_helper.dart';
import 'package:flutter_application_1/data/firestore_helper.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/user.dart';



class signup extends StatefulWidget {
  static final String id = 'signup_screen';
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();
  late final UserApp userApp = UserApp(email:_yourEmail.text,
   fullName:_yourName.text,
   userName: _yourUserName.text  ) ;
    
  String email = '';
 String password = '';
 String fullName = '';
 String userName = '';
 final _yourEmail = TextEditingController();
 final _yourName = TextEditingController();
 final _yourUserName = TextEditingController();
 final _yourPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.symmetric(
      horizontal: 20,
     // vertical: 20,
      ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const SizedBox(height: 100,),
              const  Text ( 'Instagram',
                style: TextStyle(
                fontFamily: 'InstaFont',
                fontSize: 50.0
       ),
        
       ),


           
             const SizedBox(height: 30,),
                TextFormField(
                 controller: _yourEmail ,
                  decoration:const InputDecoration(
                  hintText: 'Email' ,
                  hintStyle: TextStyle(color: Colors.black45)
                ),
                validator: (input) => !input!.contains('@') ?
               'Pleas enter a valide email that contains @ ' :
                null,
               onSaved: (input) => email,
                ),
    
                const SizedBox(height: 10,),

                TextFormField(
                  //
                  controller: _yourName,
                  decoration: const InputDecoration(
                  hintText: ('Full Name'),
                  hintStyle: TextStyle(color: Colors.black45)  ,
                  
                ),
                validator: (input) => input!.trim().isNotEmpty?
                null:
                'Please enter a valide name',
                onSaved: (input) => fullName,
                ),
                const SizedBox(height: 10 , ),
                 TextFormField(
                 controller:_yourUserName ,
                  decoration:const InputDecoration(
                  hintText: 'Username' ,
                  hintStyle: TextStyle(color: Colors.black45)
                ),
                validator: (input) => input!.trim().isNotEmpty?
                null :'Please enter a valide user name',
                onSaved: (input) => userName,
                ),
    
                const SizedBox(height: 10,),
                    TextFormField(
                 controller: _yourPassword ,
                  decoration:const InputDecoration(
                  hintText: 'Password' ,
                  hintStyle: TextStyle(color: Colors.black45)
                ),
                obscureText: true,
                validator: (input) => input!.length < 6?
               'You password must be at least 6 caracthar' :
                null,
                onSaved: (input) => password,
                ),
    
                const SizedBox(height: 30,),
                SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal:150,vertical: 20),
              //function needed
              onPressed: () async{
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  AuthHelper.authHelper.signUp(_yourEmail.text , _yourPassword.text);
                  FireStoreHelper.fireStoreHelper.addUserToFireStor(
                   userApp );
                Navigator.pushReplacementNamed(context, HomeScreen.id);

                }


               

              },
              //Shape Style fo the button
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
                ),
              
              //Text Style
              child: const Text('Sign up' ,
              style: TextStyle(
                     color: Colors.white,
                     fontSize: 15,
                     fontWeight: FontWeight.bold,
              ),
              ) ,
              ),
          ),

          const SizedBox(height: 180,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
             const Text('Already have an account?',
             style: TextStyle(color:Colors.black45 ), ),
              

              TextButton(
              onPressed:() => Navigator.pushNamed(context, login.id) ,
              child: const Text('Login',
              style: TextStyle(
                fontWeight: FontWeight.w900),
              ),
               ),],
            ),
            ]),
      ),

    ))
    );
  }
}