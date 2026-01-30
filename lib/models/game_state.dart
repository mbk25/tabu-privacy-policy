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
  }

  void switchTeam() {
    currentTeam = currentTeam == 1 ? 2 : 1;
    passesLeft = passLimit; // Her tur başında pas hakkı yenilenir
  }

  String get currentTeamName => currentTeam == 1 ? team1Name : team2Name;

  bool get hasWinner => team1Score >= targetScore || team2Score >= targetScore;

  String get winnerName => team1Score >= targetScore ? team1Name : team2Name;
}
