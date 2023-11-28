import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/laptop.dart';
import '../providerpart/laptopslist.dart';
class ScreenRepairedLaptops extends StatefulWidget {
  const ScreenRepairedLaptops({super.key});

  @override
  State<ScreenRepairedLaptops> createState() => _ScreenRepairedLaptopsState();
}

class _ScreenRepairedLaptopsState extends State<ScreenRepairedLaptops> {
  @override
  Widget build(BuildContext context) {

List<Laptop> repairedLaptops=context.watch<ListOfLaptops>().repairedLaptops;
    return Scaffold(
      appBar: AppBar(
        title: Text("Laptops with problems"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
          itemCount: repairedLaptops.length,
          itemBuilder: (context,index){
            Laptop currentlaptop =repairedLaptops[index];
            return ListTile(

              title: Text(currentlaptop.name),
              subtitle: Text(currentlaptop.poblemDescription),
              leading: Text(currentlaptop.model,
                style: TextStyle(
                  color: (repairedLaptops.contains(currentlaptop))?
                  Colors.red:Colors.black,),),
            );
          }),

    );
  }
}
