import 'package:flutter/material.dart';
import 'package:poc_mvp_fyp/TherapyModuleSelection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP Login Demo',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true, // hide password
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextButton(
              onPressed: () => _handleLoginAttempt(),
              child: Text('Login'),
            ),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLoginAttempt() async {
    final username = usernameController.text;
    final password = passwordController.text;

    // Hardcoded user data for MVP (replace with actual login logic)
    const jsonData = {
      'username': 'user1',
      'password': 'password1',
      'name': 'John Doe',
      'email': 'johndoe@example.com',
    };

    // Simulate server response based on hardcoded data
    if (username == jsonData['username'] && password == jsonData['password']) {
      setState(() {
        errorMessage = "";
        currentUser = jsonData['username']!; // Store username for MVP
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else {
      setState(() {
        errorMessage = "Invalid username or password.";
      });
    }
  }
}

// Add a list to store earned badges
List<IconData> earnedBadges = [];

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use hardcoded data for profile (replace with actual data retrieval)
    const jsonData = {
      'username': 'demo_user',
      'name': 'John Doe',
      'email': 'johndoe@example.com',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Username: ${jsonData['username']}', // Use hardcoded data
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                'Email: ${jsonData['email']}', // Use hardcoded data
                style: TextStyle(fontSize: 18.0),
              ),
              ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TherapyModuleSelection())),
              child: Text('Select Therapy Module'),
              ),
              Text(
                'Earned Badges:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              Wrap(
                spacing: 10.0, // Adjust spacing between badges
                children: [
                  for (IconData badge in earnedBadges)
                    Icon(
                      badge,
                      size: 50.0, // Adjust badge size
                      color: Colors.amber, // Adjust badge color
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder for actual user data (replace with proper storage later)
String currentUser = "";
