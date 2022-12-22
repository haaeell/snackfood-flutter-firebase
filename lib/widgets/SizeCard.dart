import 'package:snackfood/models/size.dart';
import 'package:flutter/material.dart';
import 'package:snackfood/theme.dart';

class SizeCard extends StatelessWidget {
  final Size size;
  const SizeCard(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: size.isActive
          ? Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.redAccent,
                  width: 1.5,
                ),
              ),
              child: Text(
                size.name,
                style: poppinsTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.redAccent,
                  width: 1,
                ),
              ),
              child: Text(
                size.name,
                style: poppinsTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
    );
  }
}
