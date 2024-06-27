import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //color and brightness
    const Color color = Colors.green;
    const Brightness brightness = Brightness.dark;

    return MaterialApp(
      theme: ThemeData(
        brightness: brightness,
        iconTheme: const IconThemeData(color: color),
        colorSchemeSeed: color,
      ),
      debugShowCheckedModeBanner: false,
      home: const CartScreen(),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MyAppBar(),
          Expanded(child: ProductList()),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [SummaryWidget(), CheckoutButtonWidget()],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "3 Items",
              style: GoogleFonts.jost(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            )),
        const ProductItem(
          name: "SofaSculpt",
          desc: "Comfy Chair",
          price: "\$ 39",
          qty: 1,
          image: 'assets/images/pexels1.jpg',
        ),
        const ProductItem(
          name: "Timber Trove",
          desc: "Playwood Chair",
          price: "\$ 29",
          qty: 1,
          image: 'assets/images/pexels2.jpg',
        ),
        const ProductItem(
          name: "LuxeLiving",
          desc: "Arm Chair",
          price: "\$ 49",
          qty: 1,
          image: 'assets/images/pexels3.jpg',
        ),
      ],
    );
  }
}

class CheckoutButtonWidget extends StatelessWidget {
  const CheckoutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).colorScheme.onPrimaryContainer),
        child: Center(
          child: Text(
            "PROCEED TO CHECKOUT",
            style: GoogleFonts.jost(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onPrimary)),
          ),
        ),
      ),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.onInverseSurface,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SummaryItemWidget(label: "Subtotal", value: "\$ 117"),
              SummaryItemWidget(label: "Shipping", value: "\$ 4"),
              SummaryItemWidget(label: "Tax", value: "\$  7"),
              SummaryItemWidget(
                label: "Total",
                value: "\$ 128",
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryItemWidget extends StatelessWidget {
  const SummaryItemWidget({
    super.key,
    required this.label,
    required this.value,
    this.textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  });

  final String label;
  final String value;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.jost(textStyle: textStyle)),
          Text(value, style: GoogleFonts.jost(textStyle: textStyle)),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.desc,
    required this.price,
    required this.qty,
    required this.image,
  });

  final String name;
  final String desc;
  final String price;
  final int qty;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: AssetImage(image))),
              height: 120,
              width: 120,
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.jost(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        desc,
                        style: GoogleFonts.jost(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        price,
                        style: GoogleFonts.jost(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Qty",
                        style: GoogleFonts.jost(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(color: Theme.of(context).colorScheme.onInverseSurface, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            qty.toString(),
                            style: GoogleFonts.jost(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(color: Theme.of(context).colorScheme.onInverseSurface, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
              ),
              Text(
                "Your Shopping Cart",
                style: GoogleFonts.jost(textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  const SizedBox(height: 45, child: Icon(Icons.shopping_cart_outlined, size: 32)),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 15),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile_user.jpg"),
                  ),
                ),
                width: 40,
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
