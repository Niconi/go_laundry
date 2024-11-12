import 'package:flutter/material.dart';
import 'package:go_laundry/themes.dart';

class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: grayColor,
        child: Icon(icon, color: whiteColor),
      ),
      title: Text(
        title,
        style: regularText14,
      ),
      subtitle: Text(
        subtitle,
        style: regularText12,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
