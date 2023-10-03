 import 'package:all_in_one/reversestring.dart';
import 'package:all_in_one/simple_interest.dart';
import 'package:all_in_one/temperature.dart';
import 'package:flutter/material.dart';

import 'area_of_circle.dart';

class Homepage extends StatelessWidget {
   const Homepage({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("All In One",),
         centerTitle: true,
       ),
       body: Padding(
         padding:EdgeInsets.all(20) ,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(
               height: 10,
             ),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const AreaOfCircle()),
                   );
                 },
                 child: Text("Area of Circle"),
               ),
             ),
             SizedBox(
               height: 10,
             ),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: (){
                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const SimpleInterest()),
                 );
                 },
                 child: Text("Simple Interest"),
               ),
             ),
             SizedBox(
               height: 10,
             ),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: (){
                   Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const Temperature()),
                 );
                   },
                 child: Text("Temperate Calculator"),
               ),
             ),
             SizedBox(
               height: 10,
             ),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: (){

                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const ReverseString()),
                   );
                 },
                 child: Text("Reverse String"),
               ),
             ),
           ],
         ),
       ),
     );
   }
 }
