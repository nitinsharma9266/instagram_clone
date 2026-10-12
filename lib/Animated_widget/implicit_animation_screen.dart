
import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState
    extends State<ImplicitAnimationScreen> {
  bool isVisible = true;
  bool isZoomed = false;
  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. AnimatedOpacity
            const Text(
              '1. AnimatedOpacity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: AnimatedOpacity(
                opacity: isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Fade Effect',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: const Text('Toggle Visibility'),
            ),

            const SizedBox(height: 36),

            // 2. AnimatedScale
            const Text(
              '2. AnimatedScale',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: AnimatedScale(
                scale: isZoomed ? 1.4 : 1.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutBack,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isZoomed = !isZoomed;
                });
              },
              child: const Text('Zoom In / Out'),
            ),

            const SizedBox(height: 36),

            // 3. AnimatedSwitcher
            const Text(
              '3. AnimatedSwitcher',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Icon(
                  isSuccess
                      ? Icons.check_circle
                      : Icons.hourglass_empty,
                  key: ValueKey<bool>(isSuccess),
                  size: 100,
                  color: isSuccess
                      ? Colors.green
                      : Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                isSuccess ? 'Success!' : 'Waiting...',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isSuccess = !isSuccess;
                });
              },
              child: const Text('Change State'),
            ),
          ],
        ),
      ),
    );
  }
}
