class Plant {
  final int id;
  final String plantName;
  final String imagePath;
  final double probability;

  Plant(
      {required this.id,
      required this.plantName,
      required this.imagePath,
      required this.probability});
      
  
  static String plantName123="";
  static void setString(String plantName) {
    plantName123 = plantName;
  }

  static String getPlant() {
    return plantName123;
  }

  Plant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        plantName = json['plantName'],
        imagePath = json['imagePath'],
        probability = json['probability'];

  get medicinalProperties => null;

  get description => null;

  get name => null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'plantName': plantName,
        'imagePath': imagePath,
        'probability': probability
      };
}

class MedicinalProperties {
  String? commonName;
  String? description;
  String? medicinalProperties;

  MedicinalProperties(
      {this.commonName, this.description, this.medicinalProperties});

  MedicinalProperties.fromJson(Map<String, dynamic> json) {
    commonName = json['common_name'];
    description = json['description'];
    medicinalProperties = json['medicinal_properties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['common_name'] = commonName;
    data['description'] = description;
    data['medicinal_properties'] = medicinalProperties;
    return data;
  }
}

