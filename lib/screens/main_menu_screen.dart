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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  
                  // Logo & Title
                  ShaderMask(
                    shaderCallback: (bounds) =>
 AppGradients.titleGradient.createShader(bounds),
                    child: Text(
                      'SAKIN\nSÖYLEME',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.12, // Responsive font size
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'KELİME OYUNU',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  
                  SizedBox(height: screenHeight * 0.08),
                  
                  // Menu Buttons
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.9,
                      minWidth: screenWidth * 0.7,
                    ),
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
                        SizedBox(height: screenHeight * 0.02),
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
                        SizedBox(height: screenHeight * 0.02),
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
