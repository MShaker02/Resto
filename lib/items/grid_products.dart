import 'package:flutter/material.dart';
import 'package:resto/items/products.dart';


class GridProducts extends StatelessWidget { 
  const GridProducts({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                children: List.generate(products.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Image.network(
                                products[index]["image"]!,
                                height: 250,
                                width: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                            top: 8,
                         right: 8,
                              child: Material(
                        color: Colors.transparent, // important for ripple
                             shape: CircleBorder(),
                             child: InkWell(
                           customBorder: CircleBorder(),
                             onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${products[index]["title"]} added to cart 🛒")),
                        );
                                     },
                            child: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 18,
                           child: Icon(
                             Icons.shopping_cart,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                                        Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        products[index]["title"]!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        products[index]["price"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                                         )   ],
                        ),
                      ),
                                 ] )
                      ),
                    ));
                },
              ),
            );
  }
  }