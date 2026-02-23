import 'dart:convert';

import 'package:wize_cards/core/clients/assets_client.dart';
import 'package:wize_cards/data/datasources/database_helper.dart';
import 'package:wize_cards/data/models/deck_model.dart';

/// A data source for loading deck data from local assets.
///
/// This class handles the retrieval of initial deck data stored in JSON format
/// within the app's assets.
class DeckLocalDatasource {
  /// The client used to load assets.
  final AssetsClient client;
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  /// Creates a [DeckLocalDatasource] with the required [client].
  DeckLocalDatasource({required this.client});

  /// Loads the initial decks from the assets.
  ///
  /// Retrieves deck data from 'assets/data/initial_decks.json', parses it,
  /// and returns a list of [DeckModel] instances.
  /// Returns an empty list if loading or parsing fails.
  Future<List<DeckModel>> loadInitialDecks() async {
    try {
      final jsonString = await client.get('assets/data/initial_decks.json');

      final List<dynamic> jsonData = json.decode(jsonString);

      return jsonData.map((jsonItem) => DeckModel.fromJson(jsonItem)).toList();
    } catch (e) {
      return [];
    }
  }
}
