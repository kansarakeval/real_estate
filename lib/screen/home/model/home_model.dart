class HomeModel {
  String? name, image, email, mobile, rating, city, description,id, price;

  HomeModel(
      {this.id,
      this.price,
      this.name,
      this.image,
      this.email,
      this.mobile,
      this.rating,
      this.city,
      this.description});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
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
