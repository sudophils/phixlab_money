import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomSelector extends StatefulWidget {
  final Function() onTap;
  final String label;
  final double height;
  final bool isSelected;

  const CustomSelector(
      {super.key,
      required this.onTap,
      required this.label,
      this.height = 56.0,
      required this.isSelected});

  @override
  State<CustomSelector> createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16, bottom: 8),
        width: 90,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            boxShadow: widget.isSelected
                ? const [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(1, 5), blurRadius: 9)
                  ]
                : null),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
              child: Text(
            widget.label,
            style: TextStyle(
                color: widget.isSelected ? fontDarker : Colors.black87,
                fontWeight:
                    widget.isSelected ? FontWeight.w700 : FontWeight.w400),
          )),
        ),
      ),
    );
  }
}
