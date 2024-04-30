import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/pictures/1.jpg'),
            ),
            SizedBox(height: 20),
            ProfileField(
              icon: Icons.person,
              label: 'Name',
              value: 'John Doe',
            ),
            ProfileField(
              icon: Icons.email,
              label: 'Email',
              value: 'johndoe@example.com',
            ),
            ProfileField(
              icon: Icons.phone,
              label: 'Phone',
              value: '+1234567890',
            ),
            ProfileField(
              icon: Icons.location_on,
              label: 'Address',
              value: '123 Street, City, Country',
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add your logout functionality here
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  ProfileField({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(value),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            // Add edit functionality here
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }
}