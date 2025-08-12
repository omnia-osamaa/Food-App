
import 'package:flutter/material.dart';
import 'package:digitalmenu/Model/FoodModel.dart';
import 'package:digitalmenu/Home/ItemDetails.dart';
import 'package:digitalmenu/Common/Color.dart';

class HomeTab extends StatefulWidget {
  final List<Food> favoriteFoods;
  final Function(Food) onToggleFavorite;
  final int? selectedCategoryIndex;
  final String? selectedCategory;
  final Function(int, String?) onCategorySelected;

  const HomeTab({
    super.key,
    required this.favoriteFoods,
    required this.onToggleFavorite,
    required this.selectedCategoryIndex,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Food> filteredFoods = widget.selectedCategory == null
        ? dummyFoods
        : dummyFoods
            .where((food) => food.category == widget.selectedCategory)
            .toList();

    if (searchQuery.isNotEmpty) {
      filteredFoods = filteredFoods
          .where((food) =>
              food.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    return ListView(
      children: [
        const SizedBox(height: 16),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Order your favourite food!',
            style: TextStyle(
              fontSize: 18,
              color: titleText,
              fontFamily: 'poppins',
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: primary),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: placeholder),
                  ),
                ),
              ),
              if (searchQuery.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear, color: primary),
                  onPressed: () {
                    setState(() {
                      searchQuery = '';
                      searchController.clear();
                    });
                  },
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isSelected = widget.selectedCategoryIndex == index;
              return GestureDetector(
                onTap: () => widget.onCategorySelected(index, categoriesList[index]),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? primary : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    categoriesList[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white : placeholder,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.selectedCategory == null ? 'All Food' : widget.selectedCategory!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          itemCount: filteredFoods.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 280,
          ),
          itemBuilder: (context, index) {
            final food = filteredFoods[index];
            final isFavorite = widget.favoriteFoods.contains(food);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ItemDetailsView(food: food, addToCart: (_) {}),
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
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: Image.asset(food.image,
                                width: 120, height: 120, fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            food.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Row(
                            children: [
                              Text(food.cookingTime,
                                  style: TextStyle(color: Colors.grey[600])),
                              const Spacer(),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 18),
                              Text(food.rate.toString(),
                                  style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
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
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? primary : Colors.grey,
                        ),
                        onPressed: () => widget.onToggleFavorite(food),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}