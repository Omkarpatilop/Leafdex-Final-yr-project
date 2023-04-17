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
  final String commonName;
  final String description;
  final String medicinalProperties;

  MedicinalProperties({
    required this.commonName,
    required this.description,
    required this.medicinalProperties,
  });
}
