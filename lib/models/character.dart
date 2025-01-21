class Character {
  final String name;
  final String gender;
  final String culture;

  Character({required this.name, required this.gender, required this.culture});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'Desconocido',
      gender: json['gender'] ?? 'Desconocido',
      culture: json['culture'] ?? 'Desconocido',
    );
  }
}