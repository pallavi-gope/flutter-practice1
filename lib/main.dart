import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task1/qty_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => QtyProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.green;
    const Brightness brightness = Brightness.dark;

    return MaterialApp(
      theme: ThemeData(brightness: brightness, iconTheme: const IconThemeData(color: color), colorSchemeSeed: color),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  "3 Items",
                  style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const ProductList(),
              const Summary(),
              const CheckoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 20),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF006767),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            maximumSize: const Size(double.infinity, 50.0),
            minimumSize: const Size(double.infinity, 50.0)),
        child: Text('PROCEED TO CHECKOUT', style: GoogleFonts.jost(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: const Color(0xFFEFEFEF),
          color: const Color.fromARGB(255, 44, 44, 44),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Subtotal', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('\$117', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w500))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Shipping', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('\$4', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w500))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Tax', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w500)),
              Text('\$7', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w500))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Total', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$128', style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          )
        ]));
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<QtyProvider>(builder: (context, cart, child) {
      return Expanded(
        child: ListView.builder(
          itemCount: cart.products.length,
          itemBuilder: (context, index) {
            return ProductItem(
              index: index,
              subtitle: cart.products[index]['subtitle'],
              name: cart.products[index]['name'],
              image: cart.products[index]['image'],
              price: cart.products[index]['price'],
              qty: cart.products[index]['qty'],
            );
          },
        ),
      );
    });
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.index,
    required this.subtitle,
    required this.name,
    required this.image,
    required this.price,
    required this.qty,
  });

  final int index;
  final String subtitle;
  final String name;
  final String image;
  final int price;
  final int qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                subtitle,
                style: GoogleFonts.jost(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                name,
                style: GoogleFonts.jost(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${price.toString()}",
                style: GoogleFonts.jost(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
                          backgroundColor: const Color(0xFFEFEFEF),
                        ),
                        onPressed: () {
                          Provider.of<QtyProvider>(context, listen: false).decreaseQty(index);
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
                        qty.toString(),
                        style: GoogleFonts.jost(fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        style: IconButton.styleFrom(backgroundColor: const Color(0xFFEFEFEF)),
                        onPressed: () {
                          Provider.of<QtyProvider>(context, listen: false).increaseQty(index);
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
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<QtyProvider>(builder: (context, cart, child) {
      return Padding(
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
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.red,
                        ),
                        child: Text(
                          cart.totalItems.toString(),
                          style: GoogleFonts.jost(fontSize: 10, color: Colors.white),
                        ),
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
      );
    });
  }
}
