import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1 / 1.75,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              color: kWhiteColor,
              shape: RoundedRectangleBorder(borderRadius: kRAdius10),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width * .5,
                      height: size.width * .45,
                      decoration: BoxDecoration(
                        borderRadius: kRAdius10,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'asset/mobile.png',
                          ),
                        ),
                      ),
                    ),
                    kHeigt5,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          child: ItemText(
                              lines: 2,
                              name:
                                  'Smart Phone Apple Dual core Fully  Watter proof',
                              weight: FontWeight.w500,
                              fontSize: 18,
                              color: kBlackColor),
                        ),
                        kHeigt5,
                        const ItemText(
                            name: 'Apple',
                            weight: FontWeight.w500,
                            fontSize: 16,
                            color: kBlack54Color),
                        ItemText(
                            name: '€40,000',
                            weight: FontWeight.bold,
                            fontSize: 20,
                            color: kGreenColor),
                        const ItemText(
                            name: 'free delivery',
                            weight: FontWeight.w500,
                            fontSize: 18,
                            color: kBlack54Color)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
