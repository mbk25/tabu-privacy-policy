import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import '../utils/constants.dart';

class TimerWidget extends StatefulWidget {
  final int timeLeft;
  final int totalTime;

  const TimerWidget({
    super.key,
    required this.timeLeft,
    required this.totalTime,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  int _lastTimeLeft = -1;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _lastTimeLeft = widget.timeLeft;
  }

  @override
  void didUpdateWidget(TimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Süre değiştiğinde VE 10 saniyenin altındaysa animasyon oynat
    if (oldWidget.timeLeft != widget.timeLeft && widget.timeLeft > 0) {
      
      // Sadece 10 saniye ve altında animasyon
      if (widget.timeLeft <= 10) {
        _pulseController.forward(from: 0.0).then((_) {
          if (mounted) _pulseController.reverse();
        });
        
        // Tik-tak sesi çal
        _playTickSound();
      }
      
      _lastTimeLeft = widget.timeLeft;
    }
  }

  void _playTickSound() async {
    try {
      // Windows için sistem click sesi (tik-tak benzeri)
      await SystemSound.play(SystemSoundType.click);
    } catch (e) {
      debugPrint('Tick sound error: $e');
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Color _getTimerColor() {
    if (widget.timeLeft <= 10) return AppColors.danger;
    if (widget.timeLeft <= 20) return AppColors.warning;
    return AppColors.success;
  }

  @override
  Widget build(BuildContext context) {
    final progress = widget.timeLeft / widget.totalTime;

    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background circle
                CustomPaint(
                  size: const Size(80, 80),
                  painter: _TimerCirclePainter(
                    progress: 1.0,
                    color: Colors.white.withOpacity(0.2),
                    strokeWidth: 6,
                  ),
                ),
                // Progress circle
                CustomPaint(
                  size: const Size(80, 80),
                  painter: _TimerCirclePainter(
                    progress: progress,
                    color: _getTimerColor(),
                    strokeWidth: 6,
                  ),
                ),
                // Time text with additional pulse when <10
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: widget.timeLeft <= 10 ? 32 : 28,
                    fontWeight: FontWeight.w800,
                    color: widget.timeLeft <= 10 ? AppColors.danger : Colors.white,
                  ),
                  child: Text(
                    widget.timeLeft.toString(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TimerCirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _TimerCirclePainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_TimerCirclePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
