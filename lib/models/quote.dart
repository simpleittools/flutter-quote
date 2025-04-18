class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(text: json['text'] ?? '', author: json['author'] ?? '');
  }

  // TODO: I don't think I need a toJSON
}
