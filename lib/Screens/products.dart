import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiandtimbuapiimpl/Provider/provider.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 37,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 33,
                      width: 108,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text('All'),
                      ),
                    ),
                    Container(
                      height: 33,
                      width: 108,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'New Arrivals',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 33,
                      width: 108,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text('Top Sellers'),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  height: 44,
                  width: 144,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: Colors.green),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu_sharp),
                      Text('Filter & Sort', style: TextStyle(fontSize: 14)),
                      Text(
                        '3',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              //
              //
              SizedBox(
                  height: 700,
                  width: double.infinity,
                  child: products.when(data: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('No Products'),
                      );
                    } else {
                      return GridView.builder(
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final product = data[index];
                          return Column(
                            children: [
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Stack(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                          'https://api.timbu.cloud/images/${product.photos[0].url}'),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 7,
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.white),
                                        child: Center(
                                          child: Image.asset(
                                              'assets/images/favourite.png'),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 7,
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.white),
                                        child: Center(
                                          child: Image.asset(
                                              'assets/images/cart.png',
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 103,
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/₦.png'),
                                              const Text(
                                                ' 500,000',
                                                style: TextStyle(
                                                  color: Color(0xFF077929),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(children: [
                                          const Text(
                                            '5 ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/images/Star.png',
                                            height: 25,
                                          ),
                                        ]),
                                      ],
                                    ),
                                    //
                                    Text(
                                      product.description,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product.name,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }, error: (_, __) {
                    return const Center(
                      child: Text('Error cannot load products'),
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}















// class ProductsPage extends StatelessWidget {
//   const ProductsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             top: 25,
//             left: 15,
//             right: 15,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 37,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.grey,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         height: 33,
//                         width: 108,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: const Center(
//                           child: Text('All'),
//                         ),
//                       ),
//                       Container(
//                         height: 33,
//                         width: 108,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: Colors.white,
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'New Arrivals',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 33,
//                         width: 108,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: const Center(
//                           child: Text('Top Sellers'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //
//                 //
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15),
//                   child: Container(
//                     height: 44,
//                     width: 144,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(width: 1, color: Colors.green),
//                     ),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Icon(Icons.menu_sharp),
//                         Text('Filter & Sort', style: TextStyle(fontSize: 14)),
//                         Text(
//                           '3',
//                           style: TextStyle(
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 //
//                 Container(
//                   height: 1,
//                   width: double.infinity,
//                   color: Colors.grey,
//                 ),
//                 const SizedBox(height: 20),
//                 //
//                 //
//                 SizedBox(
//                   height: 900,
//                   width: double.infinity,
//                   child: GridView.builder(
//                     itemCount: 16,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       childAspectRatio: 0.6,
//                       crossAxisSpacing: 7,
//                       mainAxisSpacing: 7,
//                       crossAxisCount: 2,
//                     ),
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           Container(
//                             height: 180,
//                             width: 180,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Stack(
//                               children: [
//                                 Image.asset(
//                                   'assets/images/Frame 30.png',
//                                 ),
//                                 Positioned(
//                                   bottom: 0,
//                                   left: 7,
//                                   child: Container(
//                                     height: 32,
//                                     width: 32,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(4),
//                                         color: Colors.white),
//                                     child: Center(
//                                       child: Image.asset(
//                                           'assets/images/favourite.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 0,
//                                   right: 7,
//                                   child: Container(
//                                     height: 32,
//                                     width: 32,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(4),
//                                         color: Colors.white),
//                                     child: Center(
//                                       child: Image.asset(
//                                           'assets/images/cart.png',
//                                           color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 103,
//                             width: 180,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 10),
//                                       child: Row(
//                                         children: [
//                                           Image.asset('assets/images/₦.png'),
//                                           const Text(
//                                             ' 500,000',
//                                             style: TextStyle(
//                                               color: Color(0xFF077929),
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Row(children: [
//                                       const Text(
//                                         '5 ',
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Image.asset(
//                                         'assets/images/Star.png',
//                                         height: 25,
//                                       ),
//                                     ]),
//                                   ],
//                                 ),
//                                 //
//                                 const Text(
//                                   'GERMANY 24 AWAY JERSEY',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4),
//                                 const Text(
//                                   "Men's Jersey,",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
