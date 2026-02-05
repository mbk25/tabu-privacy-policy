import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/word.dart';
import '../providers/game_provider.dart';
import '../utils/constants.dart';

class WordCard extends StatefulWidget {
  final Word word;

  const WordCard({super.key, required this.word});

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final Set<String> _clickedTaboos = {}; // Tıklanan yasaklı kelimeleri takip et

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void didUpdateWidget(WordCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.word.word != widget.word.word) {
      _clickedTaboos.clear(); // Yeni kelimede tıklanmışları sıfırla
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return FadeTransition(
      opacity: _animation,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.95),
              Colors.white.withOpacity(0.85),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ana kelime
            Container(
              padding: EdgeInsets.all(screenWidth * 0.025),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.1),
                    AppColors.primary.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Text(
                widget.word.word,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // Responsive font size
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            
            // Yasaklı kelimeler başlık
            Text(
              'Yasaklı Kelimeler:',
              style: TextStyle(
                fontSize: screenWidth * 0.03, // Responsive font size
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1a1a1a),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            
            // Yasaklı kelimeler listesi (tıklanabilir butonlar)
            ...widget.word.taboos.map((taboo) {
              final isClicked = _clickedTaboos.contains(taboo);
              
              return GestureDetector(
                onTap: () {
                  if (!isClicked) {
                    setState(() {
                      _clickedTaboos.add(taboo);
                    });
                    
                    // GameProvider'a bildir (+0.1 puan OYNAYAN takıma)
                    context.read<GameProvider>().tabooWordPenalty();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isClicked
                          ? [AppColors.success.withOpacity(0.3), AppColors.success.withOpacity(0.2)]
                          : [AppColors.danger.withOpacity(0.15), AppColors.danger.withOpacity(0.1)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isClicked ? AppColors.success : AppColors.danger,
                      width: 2,
                    ),
                    boxShadow: isClicked ? null : [
                      BoxShadow(
                        color: AppColors.danger.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Sol taraf - Touch icon (tıklanabilir göstergesi)
                      if (!isClicked) ...[
                        const Icon(
                          Icons.touch_app,
                          color: AppColors.danger,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                      ],
                      
                      // Kelime
                      Expanded(
                        child: Text(
                          taboo,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isClicked ? AppColors.success : AppColors.dark,
                            decoration: isClicked ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                      
                      // Sağ taraf - Check icon veya ok işareti
                      if (isClicked)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              '+0.1',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.success,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.check_circle,
                              color: AppColors.success,
                              size: 20,
                            ),
                          ],
                        )
                      else
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.danger,
                          size: 14,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
