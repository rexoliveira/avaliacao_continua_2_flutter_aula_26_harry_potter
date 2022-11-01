// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HarryPotter {
  String? name;

  String? house;

  String? image;
  HarryPotter({
    this.name,
    this.house,
    this.image,
  });

  HarryPotter copyWith({
    String? name,
    String? house,
    String? image,
  }) {
    return HarryPotter(
      name: name ?? this.name,
      house: house ?? this.house,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'house': house,
      'image': image,
    };
  }

  factory HarryPotter.fromMap(Map<String, dynamic> map) {
    return HarryPotter(
      name: map['name'] != null ? map['name'] as String : null,
      house: map['house'] != null ? map['house'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HarryPotter.fromJson(String source) => HarryPotter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HarryPotter(name: $name, house: $house, image: $image)';

  @override
  bool operator ==(covariant HarryPotter other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.house == house &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ house.hashCode ^ image.hashCode;
}
