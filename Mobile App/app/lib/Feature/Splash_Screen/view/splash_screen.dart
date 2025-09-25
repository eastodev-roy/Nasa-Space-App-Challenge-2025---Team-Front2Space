import 'package:app/Feature/Splash_Screen/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());

    return Scaffold(
      body: AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, _) {
          return Stack(
            children: [
              // Gradient Background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0A192F), // Space Dark
                      Color(0xFF003B73), // Deep Ocean
                    ],
                  ),
                ),
              ),
              // Twinkling stars
              Positioned.fill(
                child: CustomPaint(
                  painter: _StarsPainter(controller.animationController.value),
                ),
              ),
              // Shark silhouette sliding in
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left:
                    controller.sharkAnimation.value +
                    MediaQuery.of(context).size.width / 2 -
                    50,
                child: const Icon(
                  Icons.shield, // Replace with shark image
                  size: 100,
                  color: Colors.tealAccent,
                ),
              ),
              // App Title Fade-in
              Positioned(
                bottom: 120,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: controller.textOpacity.value,
                  child: Column(
                    children: const [
                      Text(
                        'Sharks from Space',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Predicting & Protecting Marine Giants',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Simple star twinkle effect
class _StarsPainter extends CustomPainter {
  final double progress;
  _StarsPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.6);
    random(int seed) => ((seed * 12345) % 1000) / 1000.0;

    for (int i = 0; i < 50; i++) {
      final x = size.width * random(i + 1);
      final y = size.height * 0.3 * random(i + 2);
      final radius = 1.0 + 1.5 * random(i + 3);
      final twinkle = (0.5 + 0.5 * (progress + random(i)) % 1);
      canvas.drawCircle(Offset(x, y), radius * twinkle, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
