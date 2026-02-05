import 'package:flutter/material.dart';
import '../widgets/timer_widget.dart';
import '../utils/constants.dart';

class ScoreHeader extends StatelessWidget {
  final String team1Name;
  final String team2Name;
  final double team1Score;
  final double team2Score;
  final int timeLeft;
  final int totalTime;

  const ScoreHeader({
    super.key,
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.timeLeft,
    required this.totalTime,
  });

  String _formatScore(double score) {
    if (score == score.toInt().toDouble()) {
      return score.toInt().toString();
    }
    return score.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return RepaintBoundary(
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.035),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Takım 1
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team1Name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    _formatScore(team1Score),
                    style: TextStyle(
                      fontSize: screenWidth * 0.065, // Responsive font size
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // Timer
            TimerWidget(
              timeLeft: timeLeft,
              totalTime: totalTime,
            ),
            
            // Takım 2
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    team2Name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Text(
                    _formatScore(team2Score),
                    style: TextStyle(
                      fontSize: screenWidth * 0.065, // Responsive font size
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
