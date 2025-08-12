import 'package:flutter/material.dart';
import 'package:digitalmenu/Model/FoodModel.dart';
import 'package:digitalmenu/Home/ItemDetails.dart';
import 'package:digitalmenu/Common/Color.dart';

class FavoriteTab extends StatelessWidget {
  final List<Food> favoriteFoods;
  final Function(Food) onToggleFavorite;

  const FavoriteTab({
    super.key,
    required this.favoriteFoods,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return favoriteFoods.isEmpty
        ? const Center(
            child: Text(
              'No favorites yet.',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: favoriteFoods.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 265,
                    ),
                    itemBuilder: (context, index) {
                      final food = favoriteFoods[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ItemDetailsView(
                                  food: food, addToCart: (_) {}),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 16),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(120),
                                    child: Image.asset(food.image,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.fill),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      food.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Row(
                                      children: [
                                        Text(food.cookingTime,
                                            style: TextStyle(
                                                color: Colors.grey[600])),
                                        const Spacer(),
                                        const Icon(Icons.star,
                                            color: Colors.amber, size: 18),
                                        Text(food.rate.toString(),
                                            style: TextStyle(
                                                color: Colors.grey[600])),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '\$${food.price}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  icon: const Icon(Icons.favorite,
                                      color: primary),
                                  onPressed: () => onToggleFavorite(food),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
