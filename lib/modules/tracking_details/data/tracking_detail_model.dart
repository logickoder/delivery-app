/// Represents tracking details for a shipment.
class TrackingDetailModel {
  /// The unique receipt number associated with the shipment.
  final String receiptNumber;

  /// The current status of the shipment.
  final String status;

  /// The postal fee associated with the shipment.
  final int postalFee;

  /// The weight of the shipment.
  final int weight;

  /// The arrival time of the shipment at its destination.
  final DateTime arrivalTime;

  /// The location of the sender.
  final String senderLocation;

  /// The location of the receiver.
  final String receiverLocation;

  /// The current transit location of the shipment.
  final String transitLocation;

  /// The route taken by the shipment, represented as a list of coordinates.
  final List<List<double>> route;

  const TrackingDetailModel({
    required this.receiptNumber,
    required this.status,
    required this.postalFee,
    required this.weight,
    required this.arrivalTime,
    required this.senderLocation,
    required this.receiverLocation,
    required this.transitLocation,
    required this.route,
  });
}
