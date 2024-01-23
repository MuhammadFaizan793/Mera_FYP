import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../setting.dart';
import '../../../../job.dart';

import 'Funding.dart';
import 'User_Profile.dart';

class Profile_Setting extends StatelessWidget {
  const Profile_Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildListTile('Profile', Icons.person, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => User_Profile()));
            }),
            buildListTile('Networking', Icons.people, () {
              // Navigate to networking screen (add your navigation logic)
            }),
            buildListTile('Messaging', Icons.message, () {
              // Navigate to messaging screen (add your navigation logic)
            }),
            buildListTile('Events', Icons.event, () {
              // Navigate to events screen (add your navigation logic)
            }),
            buildListTile('Job Listings', Icons.work, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JobSearchPage()));
            }),
            buildListTile('Mentorship', Icons.school, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => User_Profile()));
            }),
            buildListTile('Donations and Fundraising', Icons.monetization_on,
                () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Funding_Screen()));
            }),
            buildListTile('Notifications', Icons.notifications, () {
              // Implement notifications functionality
            }),
            buildListTile('Search and Discovery', Icons.search, () {
              // Implement search and discovery functionality
            }),
            buildListTile('Settings', Icons.settings, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            }),
            buildListTile('Logout', Icons.exit_to_app, () {
              // Implement logout functionality
            }),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(title),
      ),
      leading: Icon(icon),
      trailing: Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
