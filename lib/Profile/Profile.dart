import 'dart:io';
import 'package:digitalmenu/Common/Color.dart';
import 'package:digitalmenu/Common/Components.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAndMoreView extends StatefulWidget {
  const ProfileAndMoreView({super.key});

  @override
  State<ProfileAndMoreView> createState() => _ProfileAndMoreViewState();
}

class _ProfileAndMoreViewState extends State<ProfileAndMoreView> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController CpasswordController = TextEditingController();
    final TextEditingController NpasswordController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();

    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "assets/img/left-arrow.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: placeholder,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(image!.path),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(Icons.person, size: 65, color: primary),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Icon(Icons.camera_alt_rounded,
                            color: primary, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormFieldWidget(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  labelText: "Name",
                  labelColor: placeholder,
                  prefixIcon: Icons.person,
                  textColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormFieldWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  labelText: "Email Address",
                  labelColor: placeholder,
                  prefixIcon: Icons.email,
                  textColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormFieldWidget(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  labelText: "Phone Number",
                  labelColor: placeholder,
                  prefixIcon: Icons.phone,
                  textColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PasswordTextFormFieldWidget(
                  controller: CpasswordController,
                  labelText: "Current Password",
                  labelColor: placeholder,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  textColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PasswordTextFormFieldWidget(
                  controller: NpasswordController,
                  labelText: "New Password",
                  labelColor: placeholder,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  textColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PasswordTextFormFieldWidget(
                  controller: confirmPassController,
                  labelText: "Confirm Password",
                  labelColor: placeholder,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  textColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileAndMoreView(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Save changes",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
