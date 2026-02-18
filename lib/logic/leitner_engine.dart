class LeitnerEngine {
  // Intervalos de repaso en días para cada caja (Niveles 1-5)
  // Caja 1: 1 día, Caja 2: 3 días, etc.
  static const List<int> _intervals = [1, 3, 7, 14, 30];

  /// Calcula el nuevo estado de la carta basado en la respuesta del usuario.
  /// Retorna un mapa con los valores listos para actualizar en SQLite.
  static Map<String, dynamic> calculateNextReview({
    required int currentBox,
    required bool isCorrect,
  }) {
    final now = DateTime.now();
    int newBox;
    int daysToAdd;

    if (isCorrect) {
      // Si acierta: Sube de nivel (sin pasar del máx)
      // Si era caja 1 (índice 0 en array), pasa a caja 2.
      newBox = currentBox < _intervals.length
          ? currentBox + 1
          : _intervals.length;

      // El intervalo se basa en la caja A LA QUE LLEGA
      // Ejemplo: Si sube a caja 2, espera _intervals[1] (3 días)
      daysToAdd = _intervals[newBox - 1];
    } else {
      // Si falla: Castigo. Vuelve a Caja 1.
      newBox = 1;
      daysToAdd = 1; // Repasar mañana obligatoriamente
    }

    // Calcular fecha futura en milisegundos (para SQLite)
    final nextReviewDate = now.add(Duration(days: daysToAdd));

    return {
      'box_index': newBox,
      'next_review': nextReviewDate.millisecondsSinceEpoch,
      'last_reviewed': now.millisecondsSinceEpoch,
    };
  }
}
