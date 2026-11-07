import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryIndex = 0;
  int selectedBottomNav = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchHomeData(),
      child: Scaffold(
        backgroundColor: const Color(0xFFEBEBEB),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                    child: CircularProgressIndicator(color: Color(0xFFF5A623)));
              } else if (state is HomeLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi !',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54)),
                          Text("Let's Start Your Day",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    // Horizontal Categories
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final isSelected = selectedCategoryIndex == index;
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(state.categories[index]),
                              selected: isSelected,
                              selectedColor: const Color(0xFFF5A623),
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.black),
                              onSelected: (_) =>
                                  setState(() => selectedCategoryIndex = index),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Products Grid
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                      child: Image.network(product.image,
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.cover),
                                    ),
                                    const Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Icon(Icons.favorite_border,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(product.title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 16),
                                              Text('${product.rating}',
                                                  style: const TextStyle(
                                                      fontSize: 12)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text('EGP ${product.price.toInt()}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(width: 6),
                                          if (product.discountPrice != null)
                                            Text(
                                              'EGP ${product.discountPrice!.toInt()}',
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedBottomNav,
          onTap: (index) => setState(() => selectedBottomNav = index),
          selectedItemColor: const Color(0xFFF5A623),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
