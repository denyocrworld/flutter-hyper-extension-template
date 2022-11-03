import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String value;
  final Function()? onPressed;

  const RowItem({
    Key? key,
    this.icon,
    this.label = "",
    this.value = "",
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon),
              const SizedBox(
                width: 6.0,
              ),
            ],
            Expanded(
              child: Text(label),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
