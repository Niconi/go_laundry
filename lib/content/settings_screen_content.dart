import 'package:flutter/material.dart';
import 'package:go_laundry/models/setting_list_item.dart';
import 'package:go_laundry/router/slide_page_router.dart';
import 'package:go_laundry/screen/settings/change_profile.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/profile_header.dart';

class SettingsScreenContent extends StatelessWidget {
  const SettingsScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Pengaturan',
          style: boldText16,
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          const ProfileHeader(),
          const SizedBox(height: 20),
          _buildSettingsSection([
            SettingsListItem(
              icon: Icons.person,
              title: 'Saya',
              subtitle: 'Buat perubahan pada akun Anda',
              onTap: () {
                Navigator.of(context)
                    .push(SlidePageRoute(page: ChangeProfile()));
              },
            ),
            SettingsListItem(
              icon: Icons.lock,
              title: 'Keamanan',
              subtitle: 'Siapkan keamanan akun Anda',
              onTap: () {},
            ),
            SettingsListItem(
              icon: Icons.logout,
              title: 'Keluar',
              subtitle: 'Keluar dari aplikasi',
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 20),
          _buildSettingsSection([
            SettingsListItem(
              icon: Icons.help,
              title: 'Bantuan & Dukungan',
              subtitle: 'Bantuan dan Dukungan Go Laundry',
              onTap: () {},
            ),
            SettingsListItem(
              icon: Icons.info,
              title: 'Tentang Kami',
              subtitle: 'Tentang Go Laundry',
              onTap: () {},
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(List<Widget> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: items,
      ),
    );
  }
}
