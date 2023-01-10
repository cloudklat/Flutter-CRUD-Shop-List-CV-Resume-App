import 'package:flutter/material.dart';

List<Product> productData = [
  Product(
      productPrice: 2000,
      productName: "Headset ATH-M20x",
      productImage: "assets/img/2.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/3.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/4.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/2.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/3.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/4.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/2.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/3.png"),
  Product(
      productPrice: 3000,
      productName: "Microphone",
      productImage: "assets/img/4.png"),
  Product(
      productPrice: 4000,
      productName: "Camera",
      productImage: "assets/img/2.png")
];

class CommerceApp extends StatefulWidget {
  const CommerceApp({super.key});

  @override
  State<CommerceApp> createState() => _CommerceAppState();
}

class _CommerceAppState extends State<CommerceApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        home: ShopPage(
          themeValue: isDark,
          themeChangedCallback: () {
            setState(() {
              isDark = !isDark;
            });
          },
        ));
  }
}

class ShopPage extends StatefulWidget {
  ShopPage(
      {super.key,
      required this.themeValue,
      required this.themeChangedCallback});
  bool themeValue;
  VoidCallback themeChangedCallback;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Shop"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoritePage()));
                },
                icon: Icon(Icons.favorite)),
            Switch(
              value: widget.themeValue,
              onChanged: (value) {
                widget.themeChangedCallback();
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productData[index]);
          },
        ));
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite Product"),
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context, index) {
          if (productData[index].isFav) {
            return ProductCard(product: productData[index]);
          } else
            return Container();
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(widget.product.productImage),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.productName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Rp.${widget.product.productPrice}")
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.product.favorite();
                  });
                },
                icon: widget.product.isFav
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_rounded))
          ],
        ),
      ),
    );
  }
}

class Product {
  String productName;
  int productPrice;
  String productImage;
  bool isFav = false;
  Product(
      {required this.productPrice,
      required this.productName,
      this.productImage = "assets/img/2.jpg"});

  void favorite() {
    isFav = !isFav;
  }
}
