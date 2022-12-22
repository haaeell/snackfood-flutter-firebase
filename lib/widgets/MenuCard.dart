import 'package:flutter/material.dart';
import 'package:snackfood/models/menu.dart';
import 'package:snackfood/pages/DetailScreen.dart';
import 'package:snackfood/theme.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  const MenuCard(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(menu.id, menu.image, menu.name,
                menu.price, menu.pricePromo, menu.note, menu.isPromo),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Container(
                  width: 130,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.network(
                    menu.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu.isPromo
                      ? Container(
                          decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            'terlaris',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Text(
                            'terlaris',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                  const SizedBox(height: 4),
                  Text(
                    menu.name,
                    style: poppinsTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Rp ${menu.price}',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: greyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Rp ${menu.price}',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: yellowColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Free Delivery',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: greyColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
