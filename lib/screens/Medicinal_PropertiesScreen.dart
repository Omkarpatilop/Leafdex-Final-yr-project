import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nebat/constants.dart';
import 'dart:convert';
import '../models/models.dart';
import 'package:nebat/services/apis.dart';

class MedicinalPropertiesScreen extends StatelessWidget {
  final String plantName;

  const MedicinalPropertiesScreen({Key? key,  required this.plantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
      left: true,
      right: true,
      minimum: EdgeInsets.all(10),
        
        child: FutureBuilder<MedicinalProperties>(
          future: PlantsAPI().getMedicinalProperties(plantName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 10,
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final medicinalProperties = snapshot.data!;
      
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}
