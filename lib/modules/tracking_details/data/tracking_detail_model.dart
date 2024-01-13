class TrackingDetailModel {
  final String receiptNumber;
  final String status;
  final int postalFee;
  final int weight;

  final DateTime arrivalTime;
  final String senderLocation;
  final String receiverLocation;
  final String transitLocation;

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
