class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json['name'].toString(),
    catchPhrase: json['catchPhrase'].toString(),
    bs: json['bs'].toString(),
  );
}
