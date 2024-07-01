class DbModel{
  int? id;
  String? name, image, email, mobile, rating, city, description, price;

  DbModel(
      {this.name,
      this.image,
      this.email,
      this.mobile,
      this.rating,
      this.city,
      this.description,
      this.id,
      this.price});

  factory DbModel.mapToModel(Map m1){
    return DbModel(
      id: m1['id'],
      price: m1['price'],
      name: m1['name'],
      image: m1['image'],
      email: m1['email'],
      mobile: m1['mobile'],
      rating: m1['rating'],
      city: m1['city'],
      description: m1['description'],
    );
  }
}