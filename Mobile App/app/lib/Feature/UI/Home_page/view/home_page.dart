import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isMenuOpen = false.obs;

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }
}

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/shark2.jpg'), // <-- your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Foreground content
          Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20 , vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo Icon
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.satellite_alt, color: Colors.white),
                    ),

                    // Menu Icon
                    Obx(() => IconButton(
                      icon: Icon(
                        controller.isMenuOpen.value ? Icons.close : Icons.menu,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: controller.toggleMenu,
                    )),
                  ],
                ),
              ),

              Spacer(),

              // Title
              Text(
                "FRONT2SPACE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12),

              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Pioneering the future of marine conservation\nthrough advanced satellite technology",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 24),

              // Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF02427A),
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Get.snackbar("Mission", "Launching mission 🚀",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black87,
                      colorText: Colors.white);
                },
                child: Text(
                  "Launch Mission",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),

              Spacer(),
            ],
          ),
        ],
      ),

    );
  }
}
