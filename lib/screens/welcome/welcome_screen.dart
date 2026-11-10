
import 'package:flutter/material.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xffe7e7e7);
    const primaryColor = Color(0xffd62976);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Instagram Icon
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-6, -6),
                        blurRadius: 12,
                      ),
                      BoxShadow(
                        color: Color(0xffbdbdbd),
                        offset: Offset(6, 6),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [
                          Color(0xFFFEDA75),
                          Color(0xFFFA7E1E),
                          Color(0xFFD62976),
                          Color(0xFF962FBF),
                          Color(0xFF4F5BD5),
                        ],
                      ).createShader(bounds);
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 65,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                const Text(
                  'Welcome to Instagram',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff333333),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Share your moments and connect\nwith people around the world.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 50),

                // Login Button
                _buildButton(
                  text: 'Log In',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Signup Button
                _buildButton(
                  text: 'Create New Account',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignupScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onTap,
  }) {
    const bgColor = Color(0xffe7e7e7);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Color(0xffbdbdbd),
              offset: Offset(5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff444444),
          ),
        ),
      ),
    );
  }
}
