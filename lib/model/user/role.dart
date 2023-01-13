class Role {
  String? slug;

  Role({this.slug});

  Role.fromJson(Map<String, dynamic> json) {
    slug = json["slug"];
  }
}
