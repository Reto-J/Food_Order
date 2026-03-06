class OrderModule {
  final String foodIds;
  final String restaurantId;
  final String userId;
  final bool isAccepted;

  OrderModule({
    required this.foodIds,
    required this.restaurantId,
    required this.userId,
    required this.isAccepted,
  });

  factory OrderModule.fromJson(Map<String, dynamic> json) {
    return OrderModule(
      foodIds: json["foodIds"],
      restaurantId: json["restaurantId"],
      userId: json["userId"],
      isAccepted: json["isAccepted"],
    );
  }

  Map<String, dynamic> toJson() => {
    "isAccepted" : isAccepted
  };
}
