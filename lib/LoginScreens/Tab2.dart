import 'package:digitalmenu/Common/Color.dart';
import 'package:digitalmenu/LoginScreens/OTP.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class tab2 extends StatefulWidget {
  const tab2({super.key});

  @override
  State<tab2> createState() => _tab2State();
}

class _tab2State extends State<tab2> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  late CountryCode countryCode;
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the default country code to India
    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.name == "Egypt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: placeholder,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      final code =
                          await countryCodePicker.showPicker(context: context);

                      if (code != null) {
                        countryCode = code;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height:
                          55, 
                      width: 80, 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: placeholder,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        countryCode.dialCode,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextFormField(
                        controller: emailController,
                         keyboardType: TextInputType.phone, 
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "EX:0102567864", // تم تغيير النص
                          hintStyle: TextStyle(color: placeholder),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, // تم ضبط المسافة الرأسية
                              horizontal: 12),
                        ),
                        style: const TextStyle(fontSize: 14), // حجم الخط
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(),
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
                    "Reset Password",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
