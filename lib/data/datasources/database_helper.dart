import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// A singleton database helper class for managing SQLite database operations.
///
/// [DatabaseHelper] provides a centralized interface for all database operations
/// in the Wize Cards application. It implements the singleton pattern to ensure
/// a single database connection throughout the app lifecycle.
///
/// Features:
/// - Lazy loading of database connection
/// - Automatic schema initialization
/// - Foreign key constraint enforcement
/// - CRUD operations for decks and cards (Sprint 2 & 3)
///
/// Usage:
/// ```dart
/// final db = await DatabaseHelper.instance.database;
/// ```
class DatabaseHelper {
  /// Singleton instance of [DatabaseHelper].
  ///
  /// Ensures only one database connection exists throughout the app.
  static final DatabaseHelper instance = DatabaseHelper._init();

  /// Internal reference to the database connection.
  ///
  /// Null until first accessed via the [database] getter.
  static Database? _database;

  /// Private constructor for singleton pattern.
  DatabaseHelper._init();

  /// Gets the database instance using lazy loading.
  ///
  /// Returns the existing database connection if already initialized,
  /// otherwise initializes the database with the 'wizecards.db' file
  /// and returns the connection.
  ///
  /// Returns:
  ///   A [Future] that resolves to the [Database] instance.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('wizecards.db');
    return _database!;
  }

  /// Initializes the database connection.
  ///
  /// Opens the database file at [filePath] in the app's documents directory.
  /// Sets the database version to 1 and configures:
  /// - Table creation via [_createDB] callback
  /// - Foreign key constraint enablement via [_onConfigure] callback
  ///
  /// Parameters:
  ///   filePath - The name of the database file (e.g., 'wizecards.db')
  ///
  /// Returns:
  ///   A [Future] that resolves to the initialized [Database] instance.
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onConfigure: _onConfigure,
    );
  }

  /// Configures database settings when the database is opened.
  ///
  /// Enables foreign key constraints which are disabled by default in SQLite.
  /// This ensures referential integrity is maintained across tables.
  ///
  /// Parameters:
  ///   db - The [Database] instance to configure.
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  /// Creates the database schema when the database is first initialized.
  ///
  /// This method is called automatically during database initialization.
  /// All table creation statements (CREATE TABLE) should be implemented here.
  ///
  /// Parameters:
  ///   db - The [Database] instance to create tables in.
  ///   version - The database version (currently 1).
  ///
  /// TODO: Sprint 2 - Implement CREATE TABLE statements for all required tables.
  Future<void> _createDB(Database db, int version) async {
    // TODO: Sprint 2 - Pegar aquí los CREATE TABLE
  }

  // ---------------------------------------------------
  // CRUD METHODS (Sprint 2 & 3)
  // ---------------------------------------------------

  // DECKS

  /// Inserts a new deck into the database.
  ///
  /// TODO: Sprint 2 - Implement insertDeck(DeckModel deck)
  ///
  /// Should insert a new study deck with its properties such as name,
  /// description, creation date, etc.
  ///
  /// Parameters:
  ///   deck - The [DeckModel] instance to insert.
  ///
  /// Returns:
  ///   A [Future] that resolves when the insertion is complete.

  /// Retrieves all decks from the database.
  ///
  /// TODO: Sprint 2 - Implement getAllDecks()
  ///
  /// Returns all decks stored in the database in their current order.
  ///
  /// Returns:
  ///   A [Future] that resolves to a list of all [DeckModel] instances.

  /// Deletes a deck and all its associated cards from the database.
  ///
  /// TODO: Sprint 2 - Implement deleteDeck(String deckId)
  ///
  /// Removes a deck by its ID. Due to foreign key constraints,
  /// all cards in the deck will also be deleted.
  ///
  /// Parameters:
  ///   deckId - The unique identifier of the deck to delete.
  ///
  /// Returns:
  ///   A [Future] that resolves when the deletion is complete.

  /// Clears all data from the database.
  ///
  /// TODO: Sprint 2 - Implement clearDatabase()
  ///
  /// Removes all decks and cards from the database. Use with caution
  /// as this operation is irreversible. Intended for testing and debugging.
  ///
  /// Returns:
  ///   A [Future] that resolves when the database is cleared.

  /// Retrieves a specific deck by its ID.
  ///
  /// TODO: Sprint 2 - Implement getDeckById(String deckId)
  ///
  /// Returns the deck with the specified ID, or null if not found.
  ///
  /// Parameters:
  ///   deckId - The unique identifier of the deck to retrieve.
  ///
  /// Returns:
  ///   A [Future] that resolves to the [DeckModel] or null if not found.

  // CARDS

  /// Inserts a new card into an existing deck.
  ///
  /// TODO: Sprint 2 - Implement insertCard(CardModel card)
  ///
  /// Adds a new flashcard to the specified deck with initial progress data.
  /// The card must reference an existing deck ID.
  ///
  /// Parameters:
  ///   card - The [CardModel] instance to insert.
  ///
  /// Returns:
  ///   A [Future] that resolves when the insertion is complete.

  /// Updates a card's information in the database.
  ///
  /// TODO: Sprint 2 - Implement updateCard(CardModel card)
  ///
  /// Updates all information for a card including front, back content,
  /// and learning progress metrics.
  ///
  /// Parameters:
  ///   card - The [CardModel] instance with updated values.
  ///
  /// Returns:
  ///   A [Future] that resolves when the update is complete.

  /// Retrieves all cards in a deck that are ready for study.
  ///
  /// TODO: Sprint 2 - Implement getCardsForStudy(String deckId)
  ///
  /// Returns cards from the specified deck filtered by study criteria.
  /// The exact filtering logic will be defined in Sprint 2.
  ///
  /// Parameters:
  ///   deckId - The unique identifier of the deck.
  ///
  /// Returns:
  ///   A [Future] that resolves to a list of [CardModel] instances ready for study.

  /// Deletes a card from the database.
  ///
  /// TODO: Sprint 2 - Implement deleteCard(String cardId)
  ///
  /// Removes a card by its ID from the database permanently.
  ///
  /// Parameters:
  ///   cardId - The unique identifier of the card to delete.
  ///
  /// Returns:
  ///   A [Future] that resolves when the deletion is complete.

  /// Retrieves a specific card by its ID.
  ///
  /// TODO: Sprint 2 - Implement getCardById(String cardId)
  ///
  /// Returns the card with the specified ID, or null if not found.
  ///
  /// Parameters:
  ///   cardId - The unique identifier of the card to retrieve.
  ///
  /// Returns:
  ///   A [Future] that resolves to the [CardModel] or null if not found.

  /// Retrieves cards from a deck that are due for study.
  ///
  /// TODO: Sprint 3 - Implement getDueCardsForDeck(String deckId)
  ///
  /// Returns only cards scheduled for study today or earlier
  /// (where dueDate <= today). Useful for spaced repetition scheduling.
  ///
  /// Parameters:
  ///   deckId - The unique identifier of the deck.
  ///
  /// Returns:
  ///   A [Future] that resolves to a list of due [CardModel] instances.

  /// Retrieves all decks that have cards due for study.
  ///
  /// TODO: Sprint 3 - Implement getDecksWithDueCards()
  ///
  /// Returns only decks that contain at least one card scheduled for
  /// study today or earlier. Useful for displaying active decks in the UI.
  ///
  /// Returns:
  ///   A [Future] that resolves to a list of decks with due cards.
}
