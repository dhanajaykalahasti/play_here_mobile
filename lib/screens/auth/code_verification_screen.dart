import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../../widgets/glass_background.dart'; // import the reusable glass background

class CodeVerificationScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  final String destination; // Email or mobile

  CodeVerificationScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    return GlassBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Verify Your Account",
              style: GoogleFonts.poppins(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "We’ve sent a code to:",
              style: TextStyle(color: Colors.white70),
            ),
            Text(
              destination,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),

            // 🔤 Alphanumeric code input
            TextField(
              controller: codeController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 20,
                fontFamily: 'Courier',
              ),
              decoration: InputDecoration(
                hintText: "Enter verification code",
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                String code = codeController.text.trim();
                if (code.isEmpty || code.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter the full verification code")),
                  );
                } else {
                  // TODO: Backend API call
                  print("Verifying code: $code");
                  _showSuccessDialog(context);
                }
              },
              child: Text("Verify", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 15),

            TextButton(
              onPressed: () {
                // TODO: Resend code logic
              },
              child: Text(
                "Didn't receive code? Resend",
                style: TextStyle(color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Verification Successful"),
        content: Text("Your account has been verified. You may now log in."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // back to login
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}