import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';
import 'package:nebat/services/apis.dart';

class MedicinalPropertiesScreen extends StatelessWidget {
  final String plantName = Plant.getPlant();
  
 MedicinalPropertiesScreen({Key? key, required String plantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MedicinalProperties>(
      
      future: PlantsAPI().getMedicinalProperties(plantName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.blue,
            strokeWidth: 10,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final medicinalProperties = snapshot.data!;

          return Column(
            children: [
              Text('Medicinal Properties of $plantName'),
              SizedBox(height: 20),
              Text('Property 1: ${medicinalProperties.commonName}'),
              SizedBox(height: 10),
              Text('Property 2: ${medicinalProperties.description}'),
              SizedBox(height: 10),
              Text('Property 3: ${medicinalProperties.medicinalProperties}'),
            ],
          );
        }
      },
    );
  }
}
