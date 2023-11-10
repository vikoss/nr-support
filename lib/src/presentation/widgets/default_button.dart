import 'package:flutter/material.dart';
import 'package:nr_soporte_mobile/src/presentation/utils/color_palette.dart';

class DefaultButton extends StatelessWidget {

  final String label;
  final Function() onPressed;

  const DefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: COLOR_WINE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        )
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}