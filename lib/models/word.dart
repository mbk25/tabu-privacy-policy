class Word {
  final String word;
  final List<String> taboos;

  const Word({
    required this.word,
    required this.taboos,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] as String,
      taboos: (json['taboos'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'taboos': taboos,
    };
  }
}
