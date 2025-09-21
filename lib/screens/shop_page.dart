import 'package:flutter/material.dart';
import 'package:resto/items/grid_products.dart';
import 'package:resto/items/list_promos.dart';
import 'package:resto/items/promos.dart';

class MainShoppingScreen extends StatelessWidget {
 const MainShoppingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Our Products"
      , style: TextStyle( fontWeight: FontWeight.bold
      , color: Colors.white),
      )
      ,centerTitle: true,
      backgroundColor: Color(0xFF724BA1),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 2,
      shadowColor: Colors.black,
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 15),
            Text("Featured Products",
            textAlign: TextAlign.center,
            style: TextStyle( fontSize: 24
            , fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: SizedBox(
                  height: 200,
                  child: PageView(
                    children: [
                       Stack(
                            children: [
                                    Positioned.fill(
                                        child: Image.network("https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU",
                                        fit: BoxFit.cover,
                                        ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      left: 12,
                                      child: Text("Premium Laptop Collection",
                                      style: TextStyle(fontFamily: 'Suwannaphum', fontSize: 20,
                                      fontWeight: FontWeight.bold, color: Colors.white  
                                    )
                                    )
                        ),
            Positioned(
                  right: 8,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {}
                         ))],
                        ),
          
       Stack(
                            children: [
                                    Positioned.fill(
                                        child: Image.asset("asset/images/201-5000x3333.jpg",
                                        fit: BoxFit.cover,
                                        ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      left: 12,
                                      child: Text("Professional Workspace",
                                      style: TextStyle(fontFamily: 'Suwannaphum', fontSize: 20,
                                      fontWeight: FontWeight.bold, color: Colors.white  
                                    )
                                    )
                        ),
                        Positioned(
                  left: 8,
                  top: 0,
                  bottom: 0,
                  child: IconButton( onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    )
                  ),
                        Positioned(
                  right: 8,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {}
                         ))
                        ],
                        ),
                      Stack(
                            children: [
                              Positioned.fill(
                               child: Image.network("https://fastly.picsum.photos/id/4/5000/3333.jpg?hmac=ghf06FdmgiD0-G4c9DdNM8RnBIN7BO0-ZGEw47khHP4",
                               fit: BoxFit.cover,
                                     ),
                                    ),
                                    Positioned(
                                      bottom: 12,
                                      left: 12,
                                      child: Text("Ambient Lighting",
                                      style: TextStyle(fontFamily: 'Suwannaphum', fontSize: 20,
                                      fontWeight: FontWeight.bold, color: Colors.white  
                                    )
                                    ),
                                    
                        ),
                        Positioned(
                  left: 8,
                  top: 0,
                  bottom: 0,
                  child: IconButton( onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    )
                  ),
                     ],
                )
           ] ),
                      ),
          ))  ,
            SizedBox(height: 15),
            Text("Shop Our Collection"
            , textAlign: TextAlign.center
            , style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 725,
              child:  GridProducts(),
        ),
        SizedBox(height: 15),
        Text("Hot Offers 🔥"
        , textAlign: TextAlign.center, style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 15), 
          ...promos.map((promos) => promoCard(
        promos["title"]!,
        promos["subtitle"]!,
        promos["badge"]!,
        promos["image"]!,
      )),
        ],
          ) 
           )
           )
          ;
  }}