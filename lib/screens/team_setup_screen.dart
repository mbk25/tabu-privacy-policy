import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/game_provider.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';
import 'game_screen.dart';

class TeamSetupScreen extends StatefulWidget {
  const TeamSetupScreen({super.key});

  @override
  State<TeamSetupScreen> createState() => _TeamSetupScreenState();
}

class _TeamSetupScreenState extends State<TeamSetupScreen> {
  final _team1Controller = TextEditingController(text: 'Takım 1');
  final _team2Controller = TextEditingController(text: 'Takım 2');
  int _roundTime = 60;
  int _targetScore = 30;
  int _passLimit = 3;

  @override
  void dispose() {
    _team1Controller.dispose();
    _team2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, 
              vertical: screenHeight * 0.015
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.15),
                  ),
                ),
                
                SizedBox(height: screenHeight * 0.01),
                
                // Title
                Center(
                  child: Text(
                    'Takım Kurulumu',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.055, // Responsive font size
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                SizedBox(height: screenHeight * 0.02),
                
                // Team inputs
                _buildInput('Takım 1 Adı', _team1Controller),
                SizedBox(height: screenHeight * 0.015),
                _buildInput('Takım 2 Adı', _team2Controller),
                
                SizedBox(height: screenHeight * 0.02),
                
                // Round time
                _buildSlider(
                  label: 'Tur Süresi',
                  value: _roundTime.toDouble(),
                  min: 30,
                  max: 120,
                  divisions: 3,
                  display: '$_roundTime saniye',
                  onChanged: (value) => setState(() => _roundTime = value.round()),
                ),
                
                const SizedBox(height: 10),
                
                // Target score
                _buildSlider(
                  label: 'Hedef Skor',
                  value: _targetScore.toDouble(),
                  min: 10,
                  max: 50,
                  divisions: 4,
                  display: '$_targetScore puan',
                  onChanged: (value) => setState(() => _targetScore = value.round()),
                ),
                
                const SizedBox(height: 10),
                
                // Pass limit
                _buildSlider(
                  label: 'Pas Hakkı',
                  value: _passLimit.toDouble(),
                  min: 0,
                  max: 6,
                  divisions: 6,
                  display: _passLimit == 0 ? 'Sınırsız' : '$_passLimit pas',
                  onChanged: (value) => setState(() => _passLimit = value.round()),
                ),
                
                const SizedBox(height: 16),
                
                //Start button
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Oyunu Başlat',
                    onPressed: () {
                      final gameProvider = context.read<GameProvider>();
                      gameProvider.startGame(
                        team1Name: _team1Controller.text.isEmpty ? 'Takım 1' : _team1Controller.text,
                        team2Name: _team2Controller.text.isEmpty ? 'Takım 2' : _team2Controller.text,
                        roundTime: _roundTime,
                        targetScore: _targetScore,
                        passLimit: _passLimit == 0 ? 999 : _passLimit, // 0 = sınırsız (999)
                      );
                      
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GameScreen(),
                        ),
                      );
                    },
                    type: ButtonType.primary,
                    isLarge: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required String display,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF3A4F7A).withOpacity(0.4),
            Colors.white.withOpacity(0.15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                display,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            activeColor: AppColors.primary,
            inactiveColor: Colors.white.withOpacity(0.2),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
