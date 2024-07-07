import 'package:flutter/material.dart';
import 'package:furnitur_app/components/title_text.dart';
import 'package:furnitur_app/services/fetchCategories.dart';
import 'package:furnitur_app/services/fetchProduct.dart';
import 'package:furnitur_app/size_config.dart';

import 'categories.dart';
import 'package:furnitur_app/models/categories.dart';
import 'package:furnitur_app/models/product.dart';
import 'recommond_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(
                title: "Browse by Categories",
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var categories = snapshot.data as List<Category>;
                  return Categories(categories: categories);
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: Image.asset("assets/ripple.gif"));
                }
              },
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(title: "Recommands For You"),
            ),
            // Right Now product is our demo product
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var products = snapshot.data as List<Product>;
                  return RecommandProducts(products: products);
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: Image.asset('assets/ripple.gif'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
