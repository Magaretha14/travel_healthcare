class MedicalScore {
  final int umurbobot;
  final int kondisiMedisbobot;
  final int pengobatanbobot;
  final int alergibobot;
  final int reaksiVaksinbobot;
  final int hamilMenyusuibobot;
  final String categories;

  MedicalScore(
      {required this.umurbobot,
      required this.kondisiMedisbobot,
      required this.pengobatanbobot,
      required this.alergibobot,
      required this.reaksiVaksinbobot,
      required this.hamilMenyusuibobot,
      required this.categories});

  factory MedicalScore.fromJson(Map<String, dynamic> json) {
    return MedicalScore(
      umurbobot: json['age'] ?? '',
      kondisiMedisbobot: json['preexisting_condition'] ?? '',
      pengobatanbobot: json['current_medication'] ?? '',
      alergibobot: json['allergies'] ?? '',
      reaksiVaksinbobot: json['previous_vaccination'] ?? '',
      hamilMenyusuibobot: json['pregnant'] ?? '',
      categories: json['categories'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': umurbobot,
      'preexisting_condition': kondisiMedisbobot,
      'current_medication': pengobatanbobot,
      'allergies': alergibobot,
      'previous_vaccination': reaksiVaksinbobot,
      'pregnant': hamilMenyusuibobot,
      'categories': categories
    };
  }
}
