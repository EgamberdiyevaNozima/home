
class RealState {

  final int id;
  final String category;
  final String image;
  final double price;
  final String currency;
  final double area;
  final String floor;
  final String location;
  final double distance;

  RealState({

    required this.id,
    required this.category,
    required this.image,
    required this.price,
    required this.currency,
    required this.area,
    required this.floor,
    required this.location,
    required this.distance,
  });

  factory RealState.fromJson(Map<String, dynamic> json) {
    return RealState(
      id: json['id'],
      category: json['category'],
      image: json['image'],
      price: json['price'],
      currency: json['currency'],
      area: json['area'],
      floor: json['floor'],
      location: json['location'],
      distance: json['distance'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category' : category,
      'image' : image,
      'price' : price,
      'currency' : currency,
      'area' : area,
      'floor' : floor,
      'location' : location,
      'distance': distance,

    };
  }
}

