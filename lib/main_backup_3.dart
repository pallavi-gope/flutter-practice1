import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> quantities = [1, 1, 1]; // Initial quantities for each product
  int get totalQuantity => quantities.reduce((a, b) => a + b);

  void _incrementQty(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void _decrementQty(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.chevron_left),
                      Text(
                        "Your Shopping Cart",
                        style: GoogleFonts.jost(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: 25,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 14,
                              height: 14,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.red,
                              ),
                              child: Text(
                                '$totalQuantity',
                                style: GoogleFonts.jost(
                                    fontSize: 10, color: Colors.white),
                              ),
                              // child: Text(
                              //     '3',
                              //     style: GoogleFonts.jost(
                              //       fontSize: 10,
                              //       fontWeight: FontWeight.normal,
                              //       color: Colors.white
                              //     )
                              //   )
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        foregroundImage: AssetImage('assets/user.png'),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "3 Items",
                // style: TextStyle(
                //   fontFamily: 'Century-semibold'
                // ),
                style:
                    GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Sofasculpt',
                                style: GoogleFonts.jost(
                                    fontSize: 14, fontWeight: FontWeight.normal)
                                // style: TextStyle(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.normal,
                                //   fontFamily: 'Century-semibold'
                                // ),
                                ),
                            Text('Comfy Chair',
                                style: GoogleFonts.jost(
                                    fontSize: 16, fontWeight: FontWeight.bold)
                                // style: TextStyle(
                                //   fontSize: 16,
                                //   fontFamily: 'Century-bold',
                                // ),
                                ),
                            Text("\$39",
                                style: GoogleFonts.jost(
                                    fontSize: 20, fontWeight: FontWeight.bold)
                                // style: TextStyle(
                                //     fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Century-bold'),
                                ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Qty',
                                      style: GoogleFonts.jost(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      style: IconButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFEFEFEF),
                                      ),
                                      onPressed: () {
                                        _decrementQty(0);
                                      },
                                      iconSize: 20,
                                      color: Colors.black,
                                      constraints: const BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      quantities[0].toString(),
                                      style: GoogleFonts.jost(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      style: IconButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFEFEFEF)),
                                      onPressed: () {
                                        _incrementQty(0);
                                      },
                                      iconSize: 20,
                                      color: Colors.black,
                                      constraints: const BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('TimberTrove',
                                style: GoogleFonts.jost(
                                    fontSize: 14, fontWeight: FontWeight.normal)
                                // style: TextStyle(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.normal,
                                //   fontFamily: 'Century-semibold'
                                // ),
                                ),
                            Text('Plywood Chair',
                                style: GoogleFonts.jost(
                                    fontSize: 16, fontWeight: FontWeight.bold)
                                // style: TextStyle(
                                //   fontSize: 16,
                                //   fontFamily: 'Century-bold',
                                // ),
                                ),
                            Text("\$29",
                                style: GoogleFonts.jost(
                                    fontSize: 20, fontWeight: FontWeight.bold)
                                // style: TextStyle(
                                //     fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Century-bold'),
                                ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Qty',
                                      style: GoogleFonts.jost(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      style: IconButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFEFEFEF)),
                                      onPressed: () {
                                        _decrementQty(1);
                                      },
                                      iconSize: 20,
                                      color: Colors.black,
                                      constraints: const BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      quantities[1].toString(),
                                      style: GoogleFonts.jost(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      style: IconButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFEFEFEF)),
                                      onPressed: () {
                                        _incrementQty(1);
                                      },
                                      iconSize: 20,
                                      color: Colors.black,
                                      constraints: const BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('LuxeLiving',
                                style: GoogleFonts.jost(
                                    fontSize: 14, fontWeight: FontWeight.normal)
                                // style: TextStyle(
                                //   fontSize: 14,
                                //   fontWeight: FontWeight.normal,
                                //   fontFamily: 'Century-semibold'
                                // ),
                                ),
                            Text('Arm Chair',
                                style: GoogleFonts.jost(
                                    fontSize: 16, fontWeight: FontWeight.bold)
                                // style: TextStyle(
                                //   fontSize: 16,
                                //   fontFamily: 'Century-bold',
                                // ),
                                ),
                            Text("\$49",
                                style: GoogleFonts.jost(
                                    fontSize: 20, fontWeight: FontWeight.bold)
                                // style: TextStyle(
                                //     fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Century-bold'),
                                ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Qty',
                                      style: GoogleFonts.jost(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      style: IconButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFEFEFEF)),
                                      onPressed: () {
                                        _decrementQty(2);
                                      },
                                      iconSize: 20,
                                      color: Colors.black,
                                      constraints: const BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      quantities[2].toString(),
                                      style: GoogleFonts.jost(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      style: IconButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFEFEFEF)),
                                      onPressed: () {
                                        _incrementQty(2);
                                      },
                                      iconSize: 20,
                                      color: Colors.black,
                                      constraints: const BoxConstraints(),
                                      padding: EdgeInsets.zero,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
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
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Subtotal',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.w500)
                          ),
                      Text('\$117',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.w500)
                          )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Shipping',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.w500)
                          ),
                      Text('\$4',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.w500)
                          )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Tax',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.w500)
                          ),
                      Text('\$7',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.w500)
                          )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                      Text('\$128',
                          style: GoogleFonts.jost(
                              fontSize: 16, fontWeight: FontWeight.bold)
                          )
                    ],
                  )
                ])),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006767),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                    ),
                    maximumSize: const Size(double.infinity, 50.0),
                    minimumSize: const Size(double.infinity, 50.0)),
                child: Text('PROCEED TO CHECKOUT',
                    style: GoogleFonts.jost(
                        fontSize: 18, fontWeight: FontWeight.w600)
                    ),
              ),
            ),
          ],
        ))));
  }
}
