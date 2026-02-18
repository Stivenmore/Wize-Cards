import 'package:wize_cards/data/models/card_model.dart';

class DeckModel {
  final String id;
  final String title;
  final String description;
  final String author;
  final String category; // Mapped from 'type'
  final bool isOfficial;
  final String colorHex;
  final List<CardModel> cards; // Las cartas anidadas

  DeckModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.category,
    required this.isOfficial,
    required this.colorHex,
    required this.cards,
  });

  // FromJson ya listo, asi me evito luego usar libreris, creo que sera mejor
  // Asi despues puedo mostrarles como se hace con librerias.
  factory DeckModel.fromJson(Map<String, dynamic> json) {
    final meta = json['metadata'] ?? {};

    return DeckModel(
      id: json['id'] ?? '',
      title: meta['title'] ?? 'Untitled Deck',
      description: meta['description'] ?? '',
      author: meta['author'] ?? 'Unknown',
      category: json['type'] ?? 'GENERAL',
      isOfficial: json['is_official'] ?? false,
      colorHex: meta['accent_color'] ?? '#1976D2',
      cards:
          (json['cards'] as List?)
              ?.map((c) => CardModel.fromJson(c))
              .toList() ??
          [],
    );
  }

  // Convertir a Map para guardar en SQLite (Aplanado)
  Map<String, dynamic> toSqlMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'category': category, // En SQL guardamos 'type' como category
      'is_official': isOfficial ? 1 : 0,
      'color_hex': colorHex,
      // Config y otros campos se omiten por simplicidad en este helper
    };
  }
}
