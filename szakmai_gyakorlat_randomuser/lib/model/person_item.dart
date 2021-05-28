class ItemPerson {
  final Name name;
  final ImageUrls imageUrls;

  ItemPerson({required this.name, required this.imageUrls});

  factory ItemPerson.fromJson(Map<String, dynamic> json) {
    return ItemPerson(
        name: Name.fromJson(json['name']),
        imageUrls: ImageUrls.fromJson(json['picture']));
  }
}

class ImageUrls {
  final String large;
  final String medium;
  final String thumbnail;

  ImageUrls(
      {required this.large, required this.medium, required this.thumbnail});

  factory ImageUrls.fromJson(Map<String, dynamic> json) {
    return ImageUrls(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail']);
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(last: json['last'], first: json['first'], title: json['title']);
  }

  @override
  String toString() {
    return "$first $last";
  }
}
