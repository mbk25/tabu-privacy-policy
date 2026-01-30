import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/word.dart';
import '../models/game_state.dart';
import '../data/words_database.dart';

class GameProvider with ChangeNotifier {
  GameState _state = GameState();
  Timer? _timer;
  final Random _random = Random(DateTime.now().millisecondsSinceEpoch);
  final AudioPlayer _tickPlayer = AudioPlayer();
  
  // Tur sonu callback - UI'ya bildirim için
  Function? onRoundEnd;

  GameState get state => _state;

  // Oyun başlat
  void startGame({
    required String team1Name,
    required String team2Name,
    required int roundTime,
    required int targetScore,
    required int passLimit,
  }) {
    _state = GameState(
      team1Name: team1Name,
      team2Name: team2Name,
      roundTime: roundTime,
      targetScore: targetScore,
      passLimit: passLimit,
      timeLeft: roundTime,
      soundEnabled: _state.soundEnabled,
      vibrationEnabled: _state.vibrationEnabled,
    );
    _state.isPlaying = true;
    startRound();
    notifyListeners();
  }

  // Tur başlat
  void startRound() {
    _state.timeLeft = _state.roundTime;
    _state.isPaused = false;
    loadNewWord();
    _startTimer();
    notifyListeners();
  }

  // Timer başlat
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_state.timeLeft > 0 && !_state.isPaused) {
        _state.timeLeft--;
        
        // Son 10 saniyede tik-tak sesi çal
        if (_state.timeLeft <= 10 && _state.timeLeft > 0 && _state.soundEnabled) {
          _playTickSound();
        }
        
        notifyListeners();
      } else if (_state.timeLeft <= 0) {
        endRound();
      }
    });
  }

  // Yeni kelime yükle
  void loadNewWord() {
    final availableWords = WordsDatabase.words
        .where((w) => !_state.usedWords.contains(w.word))
        .toList();

    // Tüm kelimeler kullanıldıysa sıfırla
    if (availableWords.isEmpty) {
      _state.usedWords = [];
      loadNewWord();
      return;
    }

    final randomWord = availableWords[_random.nextInt(availableWords.length)];
    _state.currentWord = randomWord;
    _state.usedWords = [..._state.usedWords, randomWord.word];
    notifyListeners();
  }

  // Doğru cevap
  Future<void> correctAnswer() async {
    if (_state.timeLeft <= 0 || _state.currentWord == null) return;

    // Puan ekle
    if (_state.currentTeam == 1) {
      _state.team1Score++;
    } else {
      _state.team2Score++;
    }

    // Titreşim
    if (_state.vibrationEnabled) {
      _vibrate(100);
    }

    // Kazanan kontrolü
    if (_state.hasWinner) {
      endGame();
      return;
    }

    // Yeni kelime
    loadNewWord();
  }

  // Yanlış/Pas geç
  Future<void> wrongAnswer() async {
    if (_state.timeLeft <= 0 || _state.currentWord == null) return;

    // Pas hakkı kontrolü
    if (_state.passesLeft <= 0) {
      // Titreşim (pas hakkı bitti)
      if (_state.vibrationEnabled) {
        _vibrate([100, 50, 100, 50, 100]);
      }
      return; // Pas hakkı kalmadıysa yeni kelime gelmesin
    }

    // Pas hakkını azalt
    _state.passesLeft--;

    // Titreşim
    if (_state.vibrationEnabled) {
      _vibrate([50, 50, 50]);
    }

    // Yeni kelime
    loadNewWord();
  }

  // Tabu cezası (-2 puan)
  Future<void> tabuPenalty() async {
    if (_state.timeLeft <= 0 || _state.currentWord == null) return;

    // Puan düş (-2)
    if (_state.currentTeam == 1) {
      _state.team1Score -= 2;
    } else {
      _state.team2Score -= 2;
    }

    // Güçlü titreşim
    if (_state.vibrationEnabled) {
      _vibrate([100, 50, 100]);
    }

    // Yeni kelime
    loadNewWord();
  }

  // Yasaklı kelime söyletme - puan (+0.1) ve titreşim feedback
  void tabooWordPenalty() {
    if (_state.timeLeft <= 0 || _state.currentWord == null) return;

    // Puan ekle (+0.1)
    if (_state.currentTeam == 1) {
      _state.team1Score += 0.1;
    } else {
      _state.team2Score += 0.1;
    }

    // Hafif titreşim (feedback)
    if (_state.vibrationEnabled) {
      _vibrate(50);
    }

    notifyListeners();
  }

  // Turu bitir
  void endRound() {
    _timer?.cancel();
    _state.switchTeam();
    
    // UI'ya bildirip dialog göstermesi için callback çağır
    if (onRoundEnd != null) {
      onRoundEnd!();
    }
  }
  
  // Kullanıcı onayından sonra yeni tura geç
  void continueToNextRound() {
    if (_state.isPlaying && !_state.hasWinner) {
      startRound();
    }
  }

  // Oyunu duraklat/devam ettir
  void togglePause() {
    _state.isPaused = !_state.isPaused;
    notifyListeners();
  }

  // Oyunu bitir
  void endGame() {
    _timer?.cancel();
    _state.isPlaying = false;
    notifyListeners();
  }

  // Ana menüye dön
  void returnToMenu() {
    _timer?.cancel();
    _state.reset();
    notifyListeners();
  }

  // Yeni oyun
  void newGame() {
    _timer?.cancel();
    _state.reset();
    notifyListeners();
  }

  // Ayarları güncelle
  void toggleSound() {
    _state.soundEnabled = !_state.soundEnabled;
    notifyListeners();
  }

  void toggleVibration() {
    _state.vibrationEnabled = !_state.vibrationEnabled;
    notifyListeners();
  }

  // Titreşim
  Future<void> _vibrate(dynamic pattern) async {
    if (!_state.vibrationEnabled) return;
    
    final hasVibrator = await Vibration.hasVibrator() ?? false;
    if (!hasVibrator) return;

    if (pattern is int) {
      await Vibration.vibrate(duration: pattern);
    } else if (pattern is List<int>) {
      await Vibration.vibrate(pattern: pattern);
    }
  }

  // Tik sesi çal (son 10 saniye için)
  Future<void> _playTickSound() async {
    if (!_state.soundEnabled) return;
    
    try {
      // ByteData kaynağından kısa bir tik sesi çal
      // Not: Gerçek bir tick.mp3 dosyası assets/sounds/ içine eklenirse 
      // await _tickPlayer.play(AssetSource('sounds/tick.mp3'));
      // kullanılabilir. Şimdilik basit bir beep için:
      await _tickPlayer.play(AssetSource('sounds/tick.mp3'), 
        volume: 0.5,
      );
    } catch (e) {
      // Ses dosyası yoksa sessizce devam et
      debugPrint('Tick sound not found: $e');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tickPlayer.dispose();
    super.dispose();
  }
}
