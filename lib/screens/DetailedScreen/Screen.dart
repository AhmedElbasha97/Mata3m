import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var ahmed = "aliii";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.black87,
     body: SingleChildScrollView(
       physics: ClampingScrollPhysics(),
       child: Container(
         width: Get.width,
         height: Get.height,
         child: Column(
           children: [
             Container(
               width: 350,
               height: 700,
               color: Colors.grey,
               child: Text("$ahmed",style: TextStyle(fontSize: 210),),
             ),
             Container(
               width: 350,
               height: 100,
               color: Colors.grey,
               child: TextFormField(
                 initialValue: "ahmed",
                 onTap: (){
                   setState(() {
                     ahmed = "hassan";
                   });
                 },
               ),
             ),

           ],
         ),
       ),
     ),
    );
  }
}


