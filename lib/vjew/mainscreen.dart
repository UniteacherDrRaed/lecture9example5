import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/laptop.dart';
import '../providerpart/laptopslist.dart';
import 'screenrepairedlaptops.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    List<Laptop> laptops=context.watch<ListOfLaptops>().laptops;
    List<Laptop> repairedLaptops=context.watch<ListOfLaptops>().repairedLaptops;
    return Scaffold(
      appBar: AppBar(
        title: Text("Laptops with problems"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
          itemCount: laptops.length,
          itemBuilder: (context,index){
            Laptop currentlaptop =laptops[index];
            return ListTile(
              onTap: (){
                if(!repairedLaptops.contains(currentlaptop))
               {
                 context.read<ListOfLaptops>().addtorepairedLaptops(currentlaptop);

               }
                else
                  {
                    context.read<ListOfLaptops>().removeFromrepairedLaptops(currentlaptop);
                  }
              },
              title: Text(currentlaptop.name),
              subtitle: Text(currentlaptop.poblemDescription),
              leading: Text(currentlaptop.model,
              style: TextStyle(
                  color: (repairedLaptops.contains(currentlaptop))?
              Colors.red:Colors.black,),),
            );
          }),
 floatingActionButton: FloatingActionButton.large(
   backgroundColor: Colors.pinkAccent,
     child: Icon(Icons.navigate_next),
     onPressed: (){
   Navigator.of(context).push(
     MaterialPageRoute(builder: (context)=>ScreenRepairedLaptops())
   );
 }),
    );
  }
}
