import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart'; // For File

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  File? _image;

  /// Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,

      appBar: AppBar(
        title: _buildSectionTitle("اضافة وجبة"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // Align content to the right
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(_image!), // Display selected image
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _image == null
                    ? Icon(Icons.add_a_photo, size: 50, color: Colors.grey[600])
                    : null,
              ),
            ),
            SizedBox(height: 20),
            InputField("اسم الوجبة"),
            SizedBox(height: 10),
            InputField("المطعم"),
            SizedBox(height: 10),
            InputField("السعر"),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add functionality to submit the meal
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("تمت إضافة الوجبة بنجاح!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded button
                ),
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              child: Text("إضافة",style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Rubik",
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

class InputField extends StatelessWidget {
  final String hint;

  const InputField(this.hint, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textAlign: TextAlign.right, // Align text to the right
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Rounded yellow container
          ),
          filled: true,
          fillColor: Colors.yellow,
        ),
      ),
    );
  }
}
