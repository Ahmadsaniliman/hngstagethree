import 'package:flutter/material.dart';
import 'package:uiandtimbuapiimpl/Model/cart_functions.dart';
import 'package:uiandtimbuapiimpl/Screens/products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15, right: 15
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kickoff Kits',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: Stack(
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.green,
                                ),
                                child: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      CartFunction().products.length.toString(),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //
            SizedBox(
              height: 321,
              width: double.infinity,
              child: Image.asset(
                'assets/images/Spring_prev_ui 1.png',
                fit: BoxFit.fill,
              ),
            ),
            //
            //
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                textAlign: TextAlign.center,
                '2024/2025\nPRODUCT ARRIVAL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                ),
              ),
            ),
            //
            //
            const Text(
              textAlign: TextAlign.center,
              'Your destination for top-quality football jerseys. Designed for players and fans alike, our jerseys combine performance, comfort, and style. Show your team spirit and elevate your game with Kickoff Kits!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            //
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const ProductPage(),
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 32, 122, 35),
                  ),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
