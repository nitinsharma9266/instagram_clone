
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool rememberMe = false;
  bool obscurePassword = true;

  final Color bgColor = const Color(0xffe7e7e7);

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Sign In Function

  void login() {
    if (_formKey.currentState!.validate()) {

      FocusScope.of(context).unfocus();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  // Forgot Password Function

  void forgotPassword() {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Forgot Password?'),
          content: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                emailController.dispose();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter your email'),
                    ),
                  );
                  return;
                }

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Password reset requires Firebase setup.',
                    ),
                  ),
                );

                emailController.dispose();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  // Google Sign In Function

  void googleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Google Sign-In requires Firebase configuration.',
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

            final circleSize = constraints.maxWidth * 1.08;

            return Stack(
              alignment: Alignment.center,
              children: [

                // Circular Background

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

                // Login Form

                SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth * 0.78,

                    constraints: const BoxConstraints(
                      maxWidth: 340,
                    ),

                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                    ),

                    child: Form(
                      key: _formKey,

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          // Heading

                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Sign in to your account',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Username

                          buildTextField(
                            hint: 'Username or Email',
                            icon: Icons.person,
                            controller: usernameController,
                          ),

                          const SizedBox(height: 18),

                          // Password

                          buildTextField(
                            hint: 'Password',
                            icon: Icons.lock,
                            controller: passwordController,
                            isPassword: true,
                          ),

                          const SizedBox(height: 15),

                          // Remember Me and Forgot Password

                          Row(
                            children: [

                              SizedBox(
                                width: 25,
                                height: 25,

                                child: Checkbox(
                                  value: rememberMe,
                                  activeColor: Colors.red,

                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  },
                                ),
                              ),

                              const SizedBox(width: 5),

                              const Text(
                                'Remember me',
                                style: TextStyle(fontSize: 11),
                              ),

                              const Spacer(),

                              GestureDetector(
                                onTap: forgotPassword,

                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // Sign In Button

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
                              onPressed: login,

                              child: const Text(
                                'SIGN IN',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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

                          const SizedBox(height: 12),

                          // Google Button

                          SizedBox(
                            width: double.infinity,
                            height: 45,

                            child: OutlinedButton(
                              onPressed: googleLogin,

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

                          // Sign Up

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const SignupScreen(),
                                    ),
                                  );
                                },

                                child: const Text(
                                  'Sign up',
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

      padding: const EdgeInsets.symmetric(horizontal: 12),

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
            child: TextFormField(
              controller: controller,

              obscureText: isPassword && obscurePassword,

              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter $hint';
                }

                return null;
              },

              decoration: InputDecoration(
                hintText: hint,

                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
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
