class Character {
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String alias; // Alias principal
  final List<String> aliases; // Lista completa de alias

  Character({
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.alias,
    required this.aliases,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final aliasesList = List<String>.from(json['aliases'] ?? []);
    return Character(
      name: (json['name'] as String?)?.isNotEmpty == true
          ? json['name']
          : (aliasesList.isNotEmpty ? aliasesList[0] : 'Desconocido'),
      gender: json['gender'] ?? 'Desconocido',
      culture: json['culture'] ?? 'Desconocido',
      born: json['born'] ?? 'Desconocido',
      alias: aliasesList.isNotEmpty ? aliasesList[0] : 'Desconocido',
      aliases: aliasesList,
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
        alias == otherCharacter.alias &&
        aliases.length == otherCharacter.aliases.length &&
        aliases.every((alias) => otherCharacter.aliases.contains(alias));
  }

  @override
  int get hashCode =>
      name.hashCode ^
      gender.hashCode ^
      culture.hashCode ^
      born.hashCode ^
      alias.hashCode ^
      aliases.hashCode;
}
