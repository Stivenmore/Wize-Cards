/// Extension on [DateTime] to provide relative time formatting.
extension DateFormatting on DateTime {
  /// Returns a relative time string (e.g., "5h ago", "2d ago").
  ///
  /// If less than 24 hours have passed, it shows hours.
  /// If 24 hours or more have passed, it shows days.
  String toRelativeTime() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inHours < 24) {
      return "${difference.inHours}h ago";
    } else {
      return "${difference.inDays}d ago";
    }
  }
}
