class UserData {
  UserData({
    this.user,
  });

  User user;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    user: User.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": user.toJson(),
  };
}

class User {
  User({
    this.uid,
    this.name,
    this.image,
  });

  int uid;
  String name;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
    uid: json["uid"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "image": image,
  };
}