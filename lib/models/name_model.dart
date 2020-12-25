class Name {
  final String id;
  final String name;
  final String meaning;
  final String religion;
  final String origin;
  final int numerology;
  final String gender;
  bool isFav;

  Name(
      {this.id,
      this.isFav = false,
      this.name,
      this.meaning,
      this.gender,
      this.numerology = 1,
      this.origin,
      this.religion});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
        id: json["_id"],
        name: json["name"],
        gender: json["gender"],
        meaning: json["meaning"],
        origin: json["origin"],
        religion: json["religion"],
        numerology: json["numerology"],
        isFav: false);
  }

  void makeFav() {
    isFav = true;
  }

  void notFav() {
    isFav = false;
  }
}
