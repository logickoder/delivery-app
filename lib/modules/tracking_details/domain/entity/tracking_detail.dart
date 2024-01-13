/// Represents tracking details for a shipped item.
class TrackingDetailEntity {
  /// The receipt number associated with the shipment.
  final String receiptNumber;

  /// The current status of the shipment.
  final String status;

  /// The postal fee charged for the shipment.
  final int postalFee;

  /// The weight of the shipped item.
  final int weight;

  /// The arrival time of the shipment.
  final DateTime arrivalTime;

  /// The location of the sender.
  final String senderLocation;

  /// The location of the receiver.
  final String receiverLocation;

  /// The transit location of the shipment.
  final String transitLocation;

  const TrackingDetailEntity({
    required this.receiptNumber,
    required this.status,
    required this.postalFee,
    required this.weight,
    required this.arrivalTime,
    required this.senderLocation,
    required this.receiverLocation,
    required this.transitLocation,
  });
}
