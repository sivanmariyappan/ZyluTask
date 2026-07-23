import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = true,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.textColor = Colors.white,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 25,      
        child: ElevatedButton(
          onPressed: isActive ? onPressed : null,        
          style: ElevatedButton.styleFrom(
              backgroundColor: isActive
                  ? activeColor.withOpacity(0.15) // light background
                  : inactiveColor.withOpacity(0.15),

              foregroundColor: isActive
                  ? activeColor
                  : inactiveColor,

              disabledBackgroundColor: inactiveColor.withOpacity(0.15),

              elevation: 0,

              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
        
          child: Text(
            text,
            style: TextStyle(
              color:  isActive
      ? activeColor// light background
      : inactiveColor
,
            ),
          ),
        ),
      ),
    );
  }
}