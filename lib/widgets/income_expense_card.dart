import 'package:flutter/material.dart';

import '../utils/constants.dart';

class IncomeExpenseCard extends StatelessWidget {
  final String label;
  final String balance;
  final IconData icon;
  final Color bgColor;

  const IncomeExpenseCard(
      {Key? key,
      required this.label,
      required this.balance,
      required this.icon,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
      height: 80,
      width: (size.width / 2) - defaultSpacing,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultRadius),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                        fontSize: fontSizeBody,
                        fontWeight: FontWeight.w300)),
                const SizedBox(
                  height: defaultSpacing / 3,
                ),
                Text(balance,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                        fontSize: fontSizeHeading - 3,
                        fontWeight: FontWeight.w800)),
              ],
            ),
            Expanded(
                child: Icon(
              icon,
              color: Colors.white,
            ))
          ],
        ),
      ),
    );
  }
}
