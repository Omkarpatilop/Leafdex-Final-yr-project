import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nebat/constants.dart';
import 'dart:convert';
import '../models/models.dart';
import 'package:nebat/services/apis.dart';

class MedicinalPropertiesScreen extends StatelessWidget {
  final String plantName;

  const MedicinalPropertiesScreen({Key? key, required this.plantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: SafeArea(
          left: true,
          right: true,
          minimum: const EdgeInsets.all(10),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Medicinal Properties of $plantName',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Common Name: ',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${medicinalProperties.commonName}',
                      style: const TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Description: ',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${medicinalProperties.description}',
                      style: const TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Medicinal Properties: ',
                      style: TextStyle(
                        fontFamily: 'Open sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${medicinalProperties.medicinalProperties}',
                      style: const TextStyle(
                        fontFamily: 'Open sans',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
