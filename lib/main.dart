import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'firebase_options.dart';


void main() async{
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme : ThemeData(
        inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade100,
        enabledBorder: OutlineInputBorder(  
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
              
        color: Colors.grey.shade300 ),
              
            
        ),

       disabledBorder: OutlineInputBorder(    
       borderRadius: BorderRadius.circular(8),
       borderSide:  BorderSide(   
       color: Colors.grey.shade300 ),   
        ),

        focusedBorder: OutlineInputBorder(    
        borderRadius: BorderRadius.circular(8),
        borderSide:  BorderSide(      
       color: Colors.grey.shade300 ),     
       ),

      )
    
    ),
      home:login(),
      routes: {
      login.id :(context) => login(),
      signup.id :(context) => signup(),
      HomeScreen.id : (context) => HomeScreen(),

    }
    ));
     }
    




/*
Future<String> get localPath async{
  final directory =await getApplicationDocumentsDirectory();
  return directory.path;
}

Future <File> get localFile async{
  final path = await localPath;
  return File('$path/data.text');
}

Future<File>  writeData (String message) async{
  final file = await localFile;
  return file.writeAsString('$message\n');
}

Future<String> readData() async{
  try{
    final file = await localFile;
    //read frome the file
    String data = await file.readAsString();
    return data;
  }
  catch(e){
    return 'Nothing saved in the file';
  }
}*/



