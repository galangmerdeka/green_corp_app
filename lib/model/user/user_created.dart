class UserCreated {
  String? id;
  String? email;
  String? name;

  UserCreated({
    this.id,
    this.email,
    this.name,
  });

  UserCreated.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.email = json["email"];
    this.name = json["name"];

    // notifyListeners();
  }

  static List<UserCreated> fromJsonList(List list) {
    if (list.length == 0) return List<UserCreated>.empty();
    return list.map((e) => UserCreated.fromJson(e)).toList();
  }
}
