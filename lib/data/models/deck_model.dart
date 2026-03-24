import 'package:wize_cards/data/models/card_model.dart';

class DeckMetadata {
  final String title;
  final String description;
  final String author;
  final List<String> tags;
  final String accentColor;

  const DeckMetadata({
    required this.title,
    required this.description,
    required this.author,
    required this.tags,
    required this.accentColor,
  });

  factory DeckMetadata.fromJson(Map<String, dynamic>? json) {
    final metadata = json ?? <String, dynamic>{};
    final dynamic tagsRaw = metadata['tags'];

    final tags = switch (tagsRaw) {
      final String value =>
        value
            .split(',')
            .map((tag) => tag.trim())
            .where((tag) => tag.isNotEmpty)
            .toList(growable: false),
      final List<dynamic> value =>
        value
            .map((tag) => tag.toString().trim())
            .where((tag) => tag.isNotEmpty)
            .toList(growable: false),
      _ => const <String>[],
    };

    return DeckMetadata(
      title: metadata['title'] ?? 'Untitled Deck',
      description: metadata['description'] ?? '',
      author: metadata['author'] ?? 'Unknown',
      tags: tags,
      accentColor: metadata['accent_color'] ?? '#1976D2',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'author': author,
      'tags': tags,
      'accent_color': accentColor,
    };
  }
}

class DeckModel {
  final String id;
  final String category; // Mapped from 'type'
  final bool isOfficial;
  final DeckMetadata metadata;
  final List<CardModel> cards; // Las cartas anidadas

  String get title => metadata.title;
  String get description => metadata.description;
  String get author => metadata.author;
  String get colorHex => metadata.accentColor;
  List<String> get tags => metadata.tags;

  DeckModel({
    required this.id,
    required this.category,
    required this.isOfficial,
    required this.metadata,
    required this.cards,
  });

  // FromJson ya listo, asi me evito luego usar libreris, creo que sera mejor
  // Asi despues puedo mostrarles como se hace con librerias.
  factory DeckModel.fromJson(Map<String, dynamic> json) {
    final metadata = DeckMetadata.fromJson(json['metadata']);

    return DeckModel(
      id: json['id'] ?? '',
      category: json['type'] ?? 'GENERAL',
      isOfficial: json['is_official'] ?? false,
      metadata: metadata,
      cards:
          (json['cards'] as List?)
              ?.map((c) => CardModel.fromJson(c as Map<String, dynamic>))
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
      'tags': tags.join(','),
      // Config y otros campos se omiten por simplicidad en este helper
    };
  }
}
