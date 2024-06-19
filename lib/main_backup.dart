import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        bottom: false, 
        left: false, 
        right: false, 
        minimum: const EdgeInsets.only(top:20.0),
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Your Shopping Cart",
                style: TextStyle(
                    fontFamily: 'Century-bold',
                    fontSize: 18,                    
                ),
              ),
              leading: const Icon(Icons.chevron_left),
              leadingWidth: 20.0,
              actions: [
                Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child:  Container(
                        width: 14,
                        height: 14,   
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.red,
                        ),
                        child: const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white
                          ),
                        ),                 

                      ),
                    ),                  
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                    ),
                  )
                                       
                  ],
                ),    
                const SizedBox(width: 10),
                const CircleAvatar(
                  foregroundImage: AssetImage('assets/user.png'),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      const SizedBox(
                        height: 40,
                        child: Text(
                          "3 Items",
                          style: TextStyle(
                            fontFamily: 'Century-semibold'
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/product1.jpg',
                                  height: 100,
                                  width: 100,
                                )),
                            const SizedBox(width: 16),
                            const Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Text(
                                    'Sofasculpt',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Century-semibold'
                                    ),
                                  ),
                                  Text(
                                    'Comfy Chair',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Century-bold',
                                    ),
                                  ),
                                  Text(
                                    "\$39",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Century-bold'),
                                  ),
                                  QuantitySelector()
                                ]))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/product2.jpg',
                                  height: 100,
                                  width: 100,
                                )),
                            const SizedBox(width: 16),
                            const Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Text(
                                    'TimberTrove',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Century-semibold'
                                    ),
                                  ),
                                  Text(
                                    'Plywood Chair',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Century-bold',
                                    ),
                                  ),
                                  Text(
                                    "\$29",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Century-bold'),
                                  ),
                                  QuantitySelector()
                                ]))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/product3.jpg',
                                  height: 100,
                                  width: 100,
                                )),
                            const SizedBox(width: 16),
                            const Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Text(
                                    'LuxeLiving',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Century-semibold'
                                    ),
                                  ),
                                  Text(
                                    'Arm Chair',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Century-bold',
                                    ),
                                  ),
                                  Text(
                                    "\$49",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Century-bold'),
                                  ),
                                  QuantitySelector()
                                ]))
                          ],
                        ),
                      ),
                    ],
                  ),              
                ),
                Container(
                    padding: const EdgeInsets.all(15),                 
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFEFEFEF),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [                      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Century-semibold'
                              ),
                            ),
                            Text(
                              '\$117',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Century-semibold'
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Shipping',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Century-semibold'
                              ),
                            ),
                            Text(
                              '\$4',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Century-semibold'
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Tax',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Century-semibold'
                              ),
                            ),
                            Text(
                              '\$7',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Century-semibold'
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Century-bold'
                              ),
                            ),
                            Text(
                              '\$128',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Century-bold'
                              ),
                            )
                          ],
                        )
                      ]
                    )
                ),
                Container(   
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 20),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        onPressed: (){

                        },                       
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color(0xFF006767),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Rounded corners
                          ),
                          maximumSize:const Size(double.infinity, 50.0),
                          minimumSize:const Size(double.infinity, 50.0)
                        ),
                        child: const Text(
                          'PROCEED TO CHECKOUT',
                          style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,  
                          fontFamily: 'Century-bold'                    
                        ),
                      ),
                    ),
                ),

              ]
            )
          )
        )
      );
  }
}

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;
  void _incrementQty(){
    setState(() {
      quantity++;
    });
  }
  void _decrementQty(){
    setState(() {
      if(quantity > 1){
        quantity--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
             const Column(
                children: [
                  Text(
                    'Qty',
                    style: TextStyle(
                      fontFamily: 'Century-bold'
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  IconButton(
                    icon:const Icon(Icons.remove),
                    style: IconButton.styleFrom(backgroundColor: const Color(0xFFEFEFEF)),
                    onPressed: _decrementQty,
                    iconSize: 20,
                    color: Colors.black,
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              Column(
                children: [
                  Text('$quantity'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add), 
                    style: IconButton.styleFrom(backgroundColor: const Color(0xFFEFEFEF)),
                    onPressed: _incrementQty,
                    iconSize: 20,
                    color: Colors.black,
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  )
                ],
              )
            ],
          );
  }
  //   Widget badge() {
  //   return Text(
  //         '$quantity',
  //         style: const TextStyle(
  //           fontSize: 10,
  //           color: Colors.white
  //         ),
  //       );  
  // }
}