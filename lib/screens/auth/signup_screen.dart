
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool obscurePassword = true;

  final Color bgColor = const Color(0xffe7e7e7);

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Signup Function

  void signup() {
    if (mobileController.text.trim().isEmpty ||
        nameController.text.trim().isEmpty ||
        usernameController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );

      return;
    }

    FocusScope.of(context).unfocus();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  // Google Signup Function

  void googleSignup() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Google Sign-Up requires Firebase configuration.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {

            double circleSize = constraints.maxWidth * 1.08;

            return Stack(
              alignment: Alignment.center,
              children: [

                // 1. Circular Background

                Container(
                  height: circleSize,
                  width: circleSize,

                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.9),
                        offset: const Offset(-12, -12),
                        blurRadius: 25,
                      ),

                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        offset: const Offset(12, 12),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                ),

                // 2. Signup Form

                SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth * 0.82,

                    constraints: const BoxConstraints(
                      maxWidth: 350,
                    ),

                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // Heading

                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff333333),
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Create your new account',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Mobile Number / Email

                        buildTextField(
                          hint: 'Mobile number or email',
                          icon: Icons.email_outlined,
                          controller: mobileController,
                        ),

                        const SizedBox(height: 15),

                        // Full Name

                        buildTextField(
                          hint: 'Full Name',
                          icon: Icons.person_outline,
                          controller: nameController,
                        ),

                        const SizedBox(height: 15),

                        // Username

                        buildTextField(
                          hint: 'Username',
                          icon: Icons.alternate_email,
                          controller: usernameController,
                        ),

                        const SizedBox(height: 15),

                        // Password

                        buildTextField(
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          controller: passwordController,
                          isPassword: true,
                        ),

                        const SizedBox(height: 25),

                        // Signup Button

                        Container(
                          width: double.infinity,
                          height: 52,

                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(15),

                            boxShadow: [
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-5, -5),
                                blurRadius: 10,
                              ),

                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                offset: const Offset(5, 5),
                                blurRadius: 10,
                              ),
                            ],
                          ),

                          child: TextButton(
                            onPressed: signup,

                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // OR Divider

                        const Row(
                          children: [
                            Expanded(
                              child: Divider(color: Colors.black26),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 11,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Divider(color: Colors.black26),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // Google Signup

                        SizedBox(
                          width: double.infinity,
                          height: 48,

                          child: OutlinedButton(
                            onPressed: googleSignup,

                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black54,

                              side: const BorderSide(
                                color: Colors.black26,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            child: const Text(
                              'Continue with Google',
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Login Navigation

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const LoginScreen(),
                                  ),
                                );
                              },

                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Reusable TextField

  Widget buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
  }) {

    return Container(
      height: 55,

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),

      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            offset: const Offset(4, 4),
            blurRadius: 8,
          ),

          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 8,
          ),
        ],
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.red.shade900,
            size: 20,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: TextField(
              controller: controller,

              obscureText: isPassword && obscurePassword,

              decoration: InputDecoration(
                hintText: hint,

                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),

                border: InputBorder.none,
              ),
            ),
          ),

          if (isPassword)
            IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },

              icon: Icon(
                obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility,

                size: 18,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
