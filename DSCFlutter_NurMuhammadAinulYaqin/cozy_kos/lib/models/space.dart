class Space{
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchen;
  int numberOfBedroom;
  int numberOfCupboard;

  Space({
    this.city, 
    this.country, 
    this.id, 
    this.imageUrl, 
    this.name, 
    this.price, 
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchen,
    this.numberOfBedroom,
    this.numberOfCupboard,
    });

    Space.fromJson(json) {
      id = json['id'];
      name = json['name'];
      city = json['city'];
      country = json['country'];
      imageUrl = json['image_url'];
      price = json['price'];
      rating = json['rating'];
      address = json['address'];
      phone = json['phone'];
      mapUrl = json['map_url'];
      photos = json['photos'];
      numberOfBedroom = json['number_of_bedrooms'];
      numberOfCupboard = json['number_of_cupboards'];
      numberOfKitchen = json['number_of_kitchens'];
    }
}