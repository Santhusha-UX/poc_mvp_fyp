import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CognitiveRestructuringExercise extends StatefulWidget {
  @override
  _CognitiveRestructuringExerciseState createState() => _CognitiveRestructuringExerciseState();
}

class _CognitiveRestructuringExerciseState extends State<CognitiveRestructuringExercise> {
  String negativeThought = '';
  String challengedThought = '';
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cognitive Restructuring')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Instruction
              Text(
                'Identify a negative thought that bothers you, and challenge it with alternative interpretations.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),

              // Negative thought input
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your negative thought',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => negativeThought = value),
              ),
              SizedBox(height: 20.0),

              // Button to challenge the thought
              ElevatedButton(
                onPressed: () => _challengeThought(),
                child: Text('Challenge the Thought'),
              ),

              // Display challenged thought
              Visibility(
                visible: challengedThought.isNotEmpty,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Here are some alternative interpretations:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(challengedThought),
                  ],
                ),
              ),

              // Mark as completed option
              Visibility(
                visible: challengedThought.isNotEmpty,
                child: SizedBox(
                  height: 20.0,
                  child: CheckboxListTile(
                    title: Text('Mark as completed'),
                    value: completed,
                    onChanged: (value) => setState(() => completed = value!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _challengeThought() {
    // Replace this with your logic for generating alternative interpretations
    // based on the entered negative thought.
    // You can store pre-written examples or implement a rule-based approach.
    setState(() {
      challengedThought = 'This is just a temporary feeling.\nI have the ability to cope with this situation.';
      _showAchievementPopup(); // Call the popup showing function here
    });
  }

  void _showAchievementPopup() {
  final size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent user from dismissing prematurely
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Choose an appropriate badge icon from icons_plus.dart
                Icon(
                  ZondIcons.trophy,
                  size: 60.0,
                  color: Colors.amber,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  'You successfully challenged your negative thought.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context), // Close the popup
                    child: Text('Okay, continue'),
                ),
              ],
            ),
          ),
          // Add a subtle background animation (optional)
          Positioned.fill(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500), // Replace with your desired value
              opacity: 0.2, // Set the starting opacity
              child: Container(
                color: Colors.black.withOpacity(0.2), // Set the animation color
              ),
            ),
          ),
        ],
      ),
    ),
  );
}}