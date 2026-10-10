


import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() =>
      _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool isExpanded = false;

  void toggleAnimation() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Lab'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOutCubic,
                width: isExpanded ? 300 : 180,
                height: isExpanded ? 220 : 140,
                decoration: BoxDecoration(
                  color: isExpanded
                      ? const Color(0xFF7158E2)
                      : const Color(0xFF1687D9),
                  borderRadius: BorderRadius.circular(
                    isExpanded ? 32 : 12,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: isExpanded ? 24 : 8,
                      offset: Offset(
                        0,
                        isExpanded ? 12 : 4,
                      ),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isExpanded
                            ? Icons.auto_awesome
                            : Icons.bolt,
                        color: Colors.white,
                        size: isExpanded ? 52 : 36,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isExpanded
                            ? 'Advanced Mode'
                            : 'Tap to Animate',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: toggleAnimation,
                icon: const Icon(Icons.animation),
                label: Text(
                  isExpanded
                      ? 'Reset Animation'
                      : 'Animate Card',
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Tap the button to see the transition',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
