import 'package:flutter/material.dart';
import 'package:poc_mvp_fyp/CognitiveRestructuringExercise.dart';

class TherapyModuleSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modulesData = [
      {
        'name': 'Relaxation Techniques',
        'description': 'Learn different methods to manage stress and anxiety.',
        'image': Icon(Icons.spa), // Placeholder icon
        'duration': 15, // In minutes (replace with actual data)
      },
      {
        'name': 'Cognitive Behavioral Therapy (CBT)',
        'description': 'Develop coping mechanisms and cognitive restructuring skills.',
        'image': Icon(Icons.psychology), // Placeholder icon
        'duration': 30, // In minutes (replace with actual data)
      },
      
      // Add more modules with relevant icons as needed
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Therapy Modules'),
      ),
      body: ListView.builder(
        itemCount: modulesData.length,
        itemBuilder: (context, index) {
          final module = modulesData[index];

          return ListTile(
            leading: module['image'] as Icon, // Cast to Icon
            title: Text(module['name'] as String), 
            subtitle: Text(module['description'] as String),
            trailing: Text('${module['duration']} mins'),
            onTap: () {
              if (module['name'] == 'Cognitive Behavioral Therapy (CBT)') {
                // Push CognitiveRestructuringExercise page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CognitiveRestructuringExercise()),
                );
              } else {
                // Show a message for other modules (handle differently if needed)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('This module is not yet implemented in MVP mode.'),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
