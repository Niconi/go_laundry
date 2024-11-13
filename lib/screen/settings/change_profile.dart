import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_laundry/models/profile_model.dart';
import 'package:go_laundry/themes.dart';
import 'package:go_laundry/widgets/custom_button.dart';
import 'package:go_laundry/widgets/custom_text_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "Someone");
    _emailController = TextEditingController(text: "someone@example.com");
    _phoneController = TextEditingController(text: "+62 1234567890");
    _addressController = TextEditingController(
        text:
            "Jalan abcd nomor 1, Pegadengan, Kabupaten Tangerang, Tangerang Selatan");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Ubah Profil',
            style: boldText16.copyWith(color: charcoalColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Container(
          color: backgroundColor,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: limeGreenColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  title: 'Nama Lengkap',
                  hintText: 'Enter your full name',
                  controller: _nameController,
                  inputType: TextInputType.name,
                  enabled: _isEditing,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  enabled: _isEditing,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'No Handphone',
                  hintText: 'Enter your phone number',
                  controller: _phoneController,
                  inputType: TextInputType.phone,
                  enabled: _isEditing,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: 'Alamat',
                  hintText: 'Enter your address',
                  controller: _addressController,
                  inputType: TextInputType.multiline,
                  maxLines: 3,
                  enabled: _isEditing,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CustomButton(
                    text: 'Perbarui Profil',
                    color: limeGreenColor,
                    onPressed: _saveProfile,
                    isEnabled: _isEditing,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
