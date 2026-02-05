import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import '../widgets/score_header.dart';
import '../widgets/word_card.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';
import 'winner_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    // Round bittiğinde çağrılacak callback'i ayarla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gameProvider = context.read<GameProvider>();
      gameProvider.onRoundEnd = () {
        _showContinueDialog();
      };
    });
  }

  // Devam et dialogunu göster
  void _showContinueDialog() {
    final gameProvider = context.read<GameProvider>();
    final currentTeamColor = gameProvider.state.currentTeam == 1 
        ? AppColors.primary 
        : AppColors.secondary;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ScaleTransition(
        scale: CurvedAnimation(
          parent: AnimationController(
            duration: const Duration(milliseconds: 300),
            vsync: Navigator.of(context),
          )..forward(),
          curve: Curves.easeOutBack,
        ),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF2D2D3A),
                  const Color(0xFF1F1F2E),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: currentTeamColor.withOpacity(0.5),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: currentTeamColor.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Team icon with animation
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        currentTeamColor.withOpacity(0.4),
                        currentTeamColor.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.groups_rounded,
                    size: 64,
                    color: currentTeamColor,
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Team name
                Text(
                  gameProvider.state.currentTeamName,
                  style: TextStyle(
                    color: currentTeamColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 8),
                
                // Subtitle
                Text(
                  'Sırası Geldi!',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 24),
                
                // Message
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Hazır olduğunuzda\ndevam edin',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Continue button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentTeamColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      shadowColor: currentTeamColor.withOpacity(0.5),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      gameProvider.continueToNextRound();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Başla',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.play_arrow_rounded, size: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final gameProvider = context.read<GameProvider>();
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Oyundan Çık?'),
            content: const Text('Oyun progress\'i kaybedilecek. Emin misiniz?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('İptal'),
              ),
              TextButton(
                onPressed: () {
                  gameProvider.returnToMenu();
                  Navigator.pop(context, true);
                },
                style: TextButton.styleFrom(foregroundColor: AppColors.danger),
                child: const Text('Çık'),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: AppGradients.background,
          ),
          child: SafeArea(
            bottom: false,
            child: Consumer<GameProvider>(
              builder: (context, gameProvider, _) {
                final state = gameProvider.state;

                // Kazanan kontrolü
                if (state.hasWinner) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WinnerScreen(),
                      ),
                    );
                  });
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final screenHeight = MediaQuery.of(context).size.height;
                    final screenWidth = MediaQuery.of(context).size.width;
                    
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight - (screenWidth * 0.06), // subtract padding
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                // Score header
                                ScoreHeader(
                                  team1Name: state.team1Name,
                                  team2Name: state.team2Name,
                                  team1Score: state.team1Score,
                                  team2Score: state.team2Score,
                                  timeLeft: state.timeLeft,
                                  totalTime: state.roundTime,
                                ),
                                
                                SizedBox(height: screenHeight * 0.018),
                                
                                // Current team indicator and pass counter
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Tur numarası göstergesi
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        'Tur ${state.currentRound}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: state.currentTeam == 1
                                                ? [AppColors.primary.withOpacity(0.3), AppColors.primary.withOpacity(0.2)]
                                                : [AppColors.secondary.withOpacity(0.3), AppColors.secondary.withOpacity(0.2)],
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          '${state.currentTeamName} Oynuyor',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    // Mola (Pause) Butonu
                                    GestureDetector(
                                      onTap: () => gameProvider.togglePause(),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.white.withOpacity(0.3),
                                            width: 2,
                                          ),
                                        ),
                                        child: Icon(
                                          state.isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    // Pas hakkı göstergesi
                                    if (state.passLimit < 999)
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: state.passesLeft > 0 
                                              ? AppColors.warning.withOpacity(0.3)
                                              : AppColors.danger.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: state.passesLeft > 0 
                                                ? AppColors.warning
                                                : AppColors.danger,
                                            width: 2,
                                          ),
                                        ),
                                        child: Text(
                                          '→ ${state.passesLeft}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: state.passesLeft > 0 ? Colors.white : AppColors.danger,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 8),
                            
                            // Word card
                            if (state.currentWord != null)
                              WordCard(word: state.currentWord!),
                            
                            const SizedBox(height: 10),
                            
                            // Action buttons (3 buttons)
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    text: '✓',
                                    onPressed: () => gameProvider.correctAnswer(),
                                    type: ButtonType.success,
                                    isLarge: true,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomButton(
                                    text: '✕',
                                    onPressed: () => gameProvider.tabuPenalty(),
                                    type: ButtonType.danger,
                                    isLarge: true,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomButton(
                                    text: '→',
                                    onPressed: () => gameProvider.wrongAnswer(),
                                    type: ButtonType.warning,
                                    isLarge: true,
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
