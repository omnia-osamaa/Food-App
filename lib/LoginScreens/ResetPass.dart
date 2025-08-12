import 'package:digitalmenu/Common/Color.dart';
import 'package:digitalmenu/Common/Components.dart';
import 'package:digitalmenu/LoginScreens/LoginScreen.dart';
import 'package:flutter/material.dart';

class Resetpass extends StatefulWidget {
  const Resetpass({super.key});

  @override
  State<Resetpass> createState() => _ResetpassState();
}

class _ResetpassState extends State<Resetpass> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Reset Your Password",
                  style: TextStyle(
                    color: primary,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PasswordTextFormFieldWidget(
                controller: passwordController,
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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String password = passwordController.text.trim();
                    String confirmPassword = confirmPassController.text.trim();

                    // Check if both password fields are empty
                    if (password.isEmpty || confirmPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill in both password fields."),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Passwords do not match."),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
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
                    "Reset",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
