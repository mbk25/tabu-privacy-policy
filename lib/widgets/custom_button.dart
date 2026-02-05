import 'package:flutter/material.dart';
import '../utils/constants.dart';

enum ButtonType { primary, secondary, success, warning, danger }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final Widget? icon;
  final bool isLarge;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
    this.isLarge = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  Gradient _getGradient() {
    switch (widget.type) {
      case ButtonType.primary:
        return AppGradients.primary;
      case ButtonType.success:
        return AppGradients.success;
      case ButtonType.warning:
        return AppGradients.warning;
      case ButtonType.danger:
        return AppGradients.danger;
      case ButtonType.secondary:
        return const LinearGradient(colors: [Colors.transparent, Colors.transparent]);
    }
  }

  Color _getTextColor() {
    return widget.type == ButtonType.warning ? AppColors.dark : Colors.white;
  }

  List<BoxShadow>? _getShadow() {
    if (widget.type == ButtonType.secondary) return null;
    
    Color shadowColor;
    switch (widget.type) {
      case ButtonType.primary:
        shadowColor = AppColors.primary;
        break;
      case ButtonType.success:
        shadowColor = AppColors.success;
        break;
      case ButtonType.warning:
        shadowColor = AppColors.warning;
        break;
      case ButtonType.danger:
        shadowColor = AppColors.danger;
        break;
      default:
        shadowColor = Colors.black;
    }

    return [
      BoxShadow(
        color: shadowColor.withOpacity(0.3),
        blurRadius: _isPressed ? 8 : 12,
        offset: Offset(0, _isPressed ? 2 : 4),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 80),
        child: Container(
          height: screenHeight * 0.07, // Responsive height
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.01,
          ),
          decoration: BoxDecoration(
            gradient: _getGradient(),
            borderRadius: BorderRadius.circular(16),
            boxShadow: _getShadow(),
            border: widget.type == ButtonType.secondary
                ? Border.all(color: Colors.white.withOpacity(0.2), width: 2)
                : null,
            color: widget.type == ButtonType.secondary
                ? Colors.white.withOpacity(0.15)
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                widget.icon!,
                SizedBox(width: screenWidth * 0.03),
              ],
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsive font size
                  fontWeight: FontWeight.w600,
                  color: _getTextColor(),
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
