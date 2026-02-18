import 'package:flutter/services.dart' show AssetBundle, rootBundle;

/// A client for loading assets from the Flutter asset bundle.
///
/// This class provides a simple interface to load string assets, with error handling.
class AssetsClient {
  /// The asset bundle to use for loading assets.
  final AssetBundle _bundle;

  /// Creates an [AssetsClient] with an optional [bundle].
  ///
  /// If [bundle] is not provided, uses [rootBundle].
  AssetsClient({AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  /// Loads the string content of the asset at the given [path].
  ///
  /// Returns the content as a [String].
  /// Throws an [Exception] if the asset cannot be loaded.
  Future<String> get(String path) async {
    try {
      return await _bundle.loadString(path);
    } catch (e) {
      throw Exception('Error loading asset: $path. Details: $e');
    }
  }
}
