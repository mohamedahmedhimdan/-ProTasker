import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  final Function(String) onMenuItemSelected;

  const SettingsMenu({Key? key, required this.onMenuItemSelected})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'الإعدادات',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('الملف الشخصي'),
            onTap: () => onMenuItemSelected('profile'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الإعدادات العامة'),
            onTap: () => onMenuItemSelected('general'),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('تسجيل الخروج'),
            onTap: () => onMenuItemSelected('logout'),
          ),
        ],
      ),
    );
  }
}
