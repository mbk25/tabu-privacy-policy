import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.15),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Oyun Kuralları',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Rules list
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildRule(
                      number: 1,
                      title: 'Oyunun Amacı',
                      description: 'Takım arkadaşlarınıza kartdaki ana kelimeyi, yasaklı kelimeleri kullanmadan anlatın.',
                    ),
                    const SizedBox(height: 16),
                    _buildRule(
                      number: 2,
                      title: 'Yasaklı Kelimeler',
                      description: 'Kartın altında yazılı yasaklı kelimeleri söylememelisiniz. Söylerseniz puan alamazsınız.',
                    ),
                    const SizedBox(height: 16),
                    _buildRule(
                      number: 3,
                      title: 'Süre',
                      description: 'Her takımın anlatmak için belirlediğiniz kadar süresi vardır (varsayılan 60 saniye).',
                    ),
                    const SizedBox(height: 16),
                    _buildRule(
                      number: 4,
                      title: 'Puan Kazanma',
                      description: 'Doğru tahmin edilen her kelime için takımınız 1 puan kazanır.',
                    ),
                    const SizedBox(height: 16),
                    _buildRule(
                      number: 5,
                      title: 'Pas Geçme',
                      description: 'Bilmediğiniz veya anlatamayacağınız kelimeleri geçebilirsiniz, ancak puan alamazsınız.',
                    ),
                    const SizedBox(height: 16),
                    _buildRule(
                      number: 6,
                      title: 'Kazanma',
                      description: 'Hedef skora ilk ulaşan takım oyunu kazanır (varsayılan 30 puan).',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRule({
    required int number,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number badge
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: AppGradients.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
