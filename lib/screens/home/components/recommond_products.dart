import 'package:flutter/material.dart';
import 'package:furnitur_app/screens/details/components/product_description.dart';
import 'product_card.dart';
import 'package:furnitur_app/models/product.dart';
import 'package:furnitur_app/screens/details/details_screen.dart';
import 'package:furnitur_app/size_config.dart';

class RecommandProducts extends StatelessWidget {
  final List<Product> products;

  const RecommandProducts({
    Key? key,
    required this.products,
  }) : super(key: key);
  // Because our Api provie us list of products

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  ));
            }),
      ),
    );
  }
}
