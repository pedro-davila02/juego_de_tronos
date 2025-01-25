class Character {
  final String name;
  final String gender;
  final String culture;
  final String born;
  final List<String> aliases;

  Character({
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.aliases,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'Desconocido',
      gender: json['gender'] ?? 'Desconocido',
      culture: json['culture'] ?? 'Desconocido',
      born: json['born'] ?? 'Desconocido',
      aliases: List<String>.from(json['aliases'] ?? []),
    );
  }

  // Sobrescribimos == y hashCode para comparar por valor
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Character otherCharacter = other as Character;
    return name == otherCharacter.name &&
        gender == otherCharacter.gender &&
        culture == otherCharacter.culture &&
        born == otherCharacter.born &&
        aliases.length == otherCharacter.aliases.length &&
        aliases.every((alias) => otherCharacter.aliases.contains(alias));
  }

  @override
  int get hashCode =>
      name.hashCode ^
      gender.hashCode ^
      culture.hashCode ^
      born.hashCode ^
      aliases.hashCode;
}
