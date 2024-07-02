// ignore_for_file: empty_constructor_bodies

class Productmodel {
  int quality;
  String name;
  double price;
  String details;
  String image;

  Productmodel({
    this.quality = 1,
    required this.name,
    required this.price,
    required this.details,
    required this.image,
  });
}
