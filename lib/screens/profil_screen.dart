import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();

  String? _profileImagePath;
  late Box profileBox;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    profileBox = await Hive.openBox('profileBox');
    setState(() {
      _nameController.text = profileBox.get('name', defaultValue: 'Eka Putri Natalya Kabelen');
      _nimController.text = profileBox.get('nim', defaultValue: '2341760107');
      _profileImagePath = profileBox.get('photo');
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final newPath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
      final File newImage = await File(pickedFile.path).copy(newPath);

      await profileBox.put('photo', newImage.path);

      setState(() {
        _profileImagePath = newImage.path;
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      await profileBox.put('name', _nameController.text);
      await profileBox.put('nim', _nimController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil disimpan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: const Color.fromARGB(255, 219, 0, 131),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImagePath != null
                          ? FileImage(File(_profileImagePath!))
                          : null,
                      child: _profileImagePath == null
                          ? const Icon(Icons.person, size: 60)
                          : null,
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt, color: Color.fromARGB(255, 245, 0, 183)),
                      onPressed: _pickImage,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pengguna',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _nimController,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'NIM tidak boleh kosong' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 240, 0, 156),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  child: const Text('Simpan'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
