import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.symmetric(
      horizontal: 20,
     // vertical: 20,
      ),
      width: MediaQuery.of(context).size.width ,
      child: 
      SingleChildScrollView(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const[
           SizedBox(height: 180,),
          Text('Hi Programmer' , 
         style: TextStyle(
          
          color: Colors.deepPurpleAccent),
          ),
         
        ],
        

    )
    )
    )
    );
  }
}