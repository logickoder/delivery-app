/// Represents an entity for tracking order history with a title and progress.
class OrderTrackingHistoryEntity {
  /// The title describing the order tracking event.
  final String title;

  /// The progress or status of the order tracking event.
  final String progress;

  const OrderTrackingHistoryEntity({
    required this.title,
    required this.progress,
  });
}
