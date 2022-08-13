import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/auth_helper.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';



class login extends StatefulWidget  {
  
  
  static final String id = 'login_screen';
   
  login({Key? key}) : super(key: key);
  

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login>  {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String email = '';
 String password = ''; 
final _yourEmail = TextEditingController();
final _yourPassWord = TextEditingController();
submit(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.symmetric(
      horizontal: 20,
     // vertical: 20,
      ),
      
      child: 
      SingleChildScrollView(child: 
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
        children :  [
          const SizedBox(height: 80,),
          const Text ( 'Instagram',
          style: TextStyle(
          fontFamily: 'InstaFont',
          fontSize: 50.0
         ),
         
          
         ),
         const SizedBox(height: 30,),
      
         //Firsst one 
          TextFormField(
           controller: _yourEmail ,
            decoration: const InputDecoration(
            hintText: ('Phone number, username or email' ),
            hintStyle: TextStyle(color: Colors.black45),
          ),
          validator: (input) => !input!.contains('@') ?
           'Pleas enter a valide email that contains @ ' :
            null,
            onSaved: (input) => email,
           
          ),
      
      
          const SizedBox(height: 18,),
          //Second one 
          TextFormField(
            controller: _yourPassWord,
            decoration:const  InputDecoration(
            hintText: ('Password'),
            hintStyle: TextStyle(color: Colors.black45),
          ),
          obscureText: true,
          validator: (input) => input!.length < 6?
           'You password must be at least 6 caracthar' :
            null,
            onSaved: (input) => password,
           
          ),
          const SizedBox(height: 8 , ),
      
          GestureDetector(
              child:
               Container(
                alignment: Alignment.centerRight,
                 child: const  Text('Forgot password?',
                 
              style: TextStyle(
              color: Colors.blue , 
              fontSize: 14 ,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              ),
              
              ),
               ),
              
            ),
      
          const SizedBox(height: 40,),
      
        //Button
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal:150,vertical: 20),
              //function needed
              onPressed : () {
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();

                  
                  AuthHelper.authHelper.signIn(_yourEmail.text, _yourPassWord.text);
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                  
                  }
                


                /*
              SpHelper.spHelper.getUser();
              if(SpHelper.spHelper.getUser() == null){
                Navigator.pushNamed(context, signup.id);
              }else Navigator.pushNamed(context, HomeScreen.id);
              */

                /*
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  SharedPreferences _prfs = await SharedPreferences.getInstance();
                 _prfs.setString('email', _yourEmail.text);
                _prfs.setString('fullName', _yourPassWord.text);

                }*/
                //save the data
                //writeData(yourEmail.text);
               // writeData(yourPassWord.text);
              },
              //Shape Style fo the button
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
      
                ),
              //Text Style
              child: const Text('Log in' ,
              style: TextStyle(
                     color: Colors.white,
                     fontSize: 17,
                     fontWeight: FontWeight.bold,
      
              ),
              ) ,
      
      
              ),
          ),
          const SizedBox(height: 293,),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text('Dont have an account?',
               style: TextStyle(color:Colors.black45 ), ),
                TextButton(
                onPressed:() => Navigator.pushNamed(context, signup.id),
                child: const Text('Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.w900),
                ),
                 ),
              ],
            )
        ]),
      ),
      )
      ),

    );
  }
}

