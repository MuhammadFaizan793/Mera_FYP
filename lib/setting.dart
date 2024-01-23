import 'package:loginsignup/views/login.dart';
import 'package:loginsignup/views/setting/changepassword.dart';
import 'package:loginsignup/views/setting/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
 // final Map<String, dynamic> userData;

  SettingsPage({super.key});
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  late String uid;// Replace with your actual variable for notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Account Section
              _buildSettingsSection(
                'Account',
                [
                  _buildSettingsOption(
                    'Edit Profile',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingsOption(
                    'Change Password',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordPage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingsOption('Privacy', () {
                    // TODO: Handle Privacy logic
                  }),
                ],
              ),
              const SizedBox(height: 20),
              // Notifications Section
              _buildSettingsSection(
                'Notifications',
                [
                  _buildSettingsOption(
                    'Show Notification',
                    () {
                      // TODO: Handle toggle notifications logic
                    },
                    isSwitch: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // More Section
              _buildSettingsSection(
                'More',
                [
                  _buildSettingsOption('Language', () {
                    // TODO: Handle language selection logic
                  }),
                  _buildSettingsOption('Terms and Conditions', () {
                    // TODO: Handle terms and conditions logic
                  }),
                  _buildSettingsOption('About Us', () {
                    // TODO: Handle about us logic
                  }),
                ],
              ),
              const SizedBox(height: 20),
              // Logout Button
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool('loggedIn', false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection(String label, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: options,
        ),
      ],
    );
  }

  Widget _buildSettingsOption(String label, Function() onTap,
      {bool isSwitch = false}) {
    return ListTile(
      title: isSwitch
          ? Row(
              children: [
                Text(label),
                Spacer(),
                Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                    // Handle toggle notifications logic
                    // You may need to update the state variable (_notificationsEnabled) accordingly
                  },
                ),
              ],
            )
          : Text(label),
        /* onTap: () async {

      if (label == 'Logout') {
          Navigator.pushReplacement(

          context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        } else {
          onTap(); // For other options, execute the provided onTap function
        }

      },*/
    );
  }
}
