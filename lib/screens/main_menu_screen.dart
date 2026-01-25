import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';
import 'team_setup_screen.dart';
import 'rules_screen.dart';
import 'settings_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  
                  // Logo & Title
                  ShaderMask(
                    shaderCallback: (bounds) =>
 AppGradients.titleGradient.createShader(bounds),
                    child: Text(
                      'SAKIN\nSÖYLEME',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 56,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 4,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'KELİME OYUNU',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  // Menu Buttons
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        CustomButton(
                          text: '🎮 Oyun Başlat',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TeamSetupScreen(),
                              ),
                            );
                          },
                          type: ButtonType.primary,
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: '📖 Kurallar',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RulesScreen(),
                              ),
                            );
                          },
                          type: ButtonType.secondary,
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: '⚙️ Ayarlar',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                          type: ButtonType.secondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
