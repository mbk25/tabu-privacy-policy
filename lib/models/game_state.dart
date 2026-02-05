import 'word.dart';

class GameState {
  String team1Name;
  String team2Name;
  double team1Score;
  double team2Score;
  int currentTeam;
  int roundTime;
  int targetScore;
  int passLimit;
  int passesLeft;
  int timeLeft;
  List<String> usedWords;
  Word? currentWord;
  bool soundEnabled;
  bool vibrationEnabled;
  bool isPlaying;
  bool isPaused;
  
  // Tur sayaçları - adil oyun için
  int team1Rounds;
  int team2Rounds;
  
  // Oyun bitti mi flag'i - endGame çağrıldığında true olur
  bool gameEnded;

  GameState({
    this.team1Name = 'Takım 1',
    this.team2Name = 'Takım 2',
    this.team1Score = 0.0,
    this.team2Score = 0.0,
    this.currentTeam = 1,
    this.roundTime = 60,
    this.targetScore = 30,
    this.passLimit = 3,
    int? passesLeft,
    this.timeLeft = 60,
    this.usedWords = const [],
    this.currentWord,
    this.soundEnabled = true,
    this.vibrationEnabled = true,
    this.isPlaying = false,
    this.isPaused = false,
    this.team1Rounds = 0,
    this.team2Rounds = 0,
    this.gameEnded = false,
  }) : passesLeft = passesLeft ?? passLimit;

  void reset() {
    team1Score = 0.0;
    team2Score = 0.0;
    currentTeam = 1;
    passesLeft = passLimit;
    timeLeft = roundTime;
    usedWords = [];
    currentWord = null;
    isPlaying = false;
    isPaused = false;
    team1Rounds = 0;
    team2Rounds = 0;
    gameEnded = false;
  }

  void switchTeam() {
    // Mevcut takımın turunu artır
    if (currentTeam == 1) {
      team1Rounds++;
    } else {
      team2Rounds++;
    }
    currentTeam = currentTeam == 1 ? 2 : 1;
    passesLeft = passLimit; // Her tur başında pas hakkı yenilenir
  }

  String get currentTeamName => currentTeam == 1 ? team1Name : team2Name;
  
  // Mevcut tur numarası (UI'da göstermek için)
  // Her iki takım oynayınca 1 tur tamamlanmış olur
  int get currentRound => (team1Rounds < team2Rounds ? team1Rounds : team2Rounds) + 1;
  
  // Turlar eşit mi?
  bool get roundsAreEqual => team1Rounds == team2Rounds;
  
  // En az bir takım hedef skora ulaştı mı?
  bool get targetReached => team1Score >= targetScore || team2Score >= targetScore;

  // Oyunun bitmesi gerekip gerekmediğini kontrol et
  bool get shouldEndGame {
    if (!targetReached) return false;
    if (!roundsAreEqual) return false;
    
    // Turlar eşit ve en az bir takım hedef skora ulaştı
    // Skorlar eşit olsa bile oyun biter (beraberlik)
    return true;
  }

  // hasWinner sadece oyun bittiyse true döner
  bool get hasWinner => gameEnded;
  
  // Beraberlik mi?
  bool get isTie => team1Score == team2Score;

  String get winnerName {
    if (team1Score > team2Score) return team1Name;
    if (team2Score > team1Score) return team2Name;
    return ''; // Beraberlik
  }
}


