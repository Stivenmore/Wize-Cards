class CardModel {
  final String id;
  final String front;
  final String back;
  final String type; // TEXT, CODE
  final String hint;

  CardModel({
    required this.id,
    required this.front,
    required this.back,
    required this.type,
    required this.hint,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] ?? '',
      front: json['front'] ?? '',
      back: json['back'] ?? '',
      type: json['type'] ?? 'TEXT',
      hint: json['hint'] ?? '',
    );
  }

  Map<String, dynamic> toSqlMap(String deckId) {
    return {
      'id': id,
      'deck_id': deckId,
      'front_text': front,
      'back_text': back,
      'type': type,
      'box_index': 1, // Default para nueva carta
      'next_review': 0,
    };
  }
}
