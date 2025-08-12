class Food {
  Food({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.cookingTime,
    required this.description,
    required this.category,
  });

  String id;
  String image;
  String name;
  int price;
  double rate;
  String cookingTime;
  String description;
  String category;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        cookingTime: json["cooking_time"],
        description: json["description"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "rate": rate,
        "cooking_time": cookingTime,
        "description": description,
        "category": category,
      };
}
class CartItem {
  final Food food;
  final String? size;
  final String? spicyOption;
  final String? ingredients;
  final int quantity;

  CartItem({
    required this.food,
    this.size,
    this.spicyOption,
    this.ingredients,
    required this.quantity,
  });

  int getTotalPrice() {
    return food.price * quantity;
  }
}
final dummyFoods = [
  Food(
    id: '1',
    image: 'assets/img/blah.png',
    name: 'بلح البحر',
    price: 600,
    rate: 4.5,
    cookingTime: '20 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus.',
    category: 'Offers',
  ),
    Food(
    id: '1',
    image: 'assets/img/blah.png',
    name: 'بلح البحر',
    price: 600,
    rate: 4.5,
    cookingTime: '20 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus.',
    category: 'Offers',
  ),
  Food(
    id: '2',
    image: 'assets/img/seafood.png',
    name: 'شوربه سي فود',
    price: 500,
    rate: 4.5,
    cookingTime: '30 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus. ',
    category: 'Soup',
  ),
  Food(
    id: '3',
    image: 'assets/img/mkarona.png',
    name: 'سمك مكرونه مقلي',
    price: 400,
    rate: 4,
    cookingTime: '15 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus. ',
    category: 'Offers',
  ),
  Food(
    id: '4',
    image: 'assets/img/estakoza.png',
    name: 'استاكوزا',
    price: 1200,
    rate: 4.8,
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus. ',
    category: 'Offers',
  ),
  Food(
    id: '5',
    image: 'assets/img/estakoza.png',
    name: 'استاكوزا',
    price: 1200,
    rate: 4.8,
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus.',
    category: 'Offers',
  ),
  Food(
      id: '6',
      image: 'assets/img/estakoza.png',
      name: 'استاكوزا',
      price: 1200,
      rate: 4.8,
      cookingTime: '18 Min',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus. ',
      category: 'Sandwiches'),
  Food(
    id: '7',
    image: 'assets/img/estakoza.png',
    name: 'استاكوزا',
    price: 1200,
    rate: 4.8,
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus. ',
    category: 'Pasta',
  ),
  Food(
    id: '8',
    image: 'assets/img/estakoza.png',
    name: 'استاكوزا',
    price: 1200,
    rate: 4.8,
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus. ',
    category: 'Rice',
  ),
  Food(
    id: '9',
    image: 'assets/img/estakoza.png',
    name: 'استاكوزا',
    price: 1200,
    rate: 4.8,
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus.',
    category: 'Salads',
  ),
  Food(
    id: '10',
    image: 'assets/img/estakoza.png',
    name: 'استاكوزا',
    price: 1200,
    rate: 4.8,
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus. ',
    category: 'Meals',
  ),
  Food(
    id: '11',
    image: 'assets/img/estakoza.png',
    name: 'استاكوزا',
    price: 1200,
    rate: 4.8,
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus porttitor accumsan. Vivamus porttitor ligula non ipsum malesuada dapibus.',
    category: 'Tagen',
  ),
];
List moreArr = [
  {
    "index": "1",
    "name": "Payment Details",
    "image": "assets/img/payment-method.png",
    "base": 0
  },

  {
    "index": "2",
    "name": "Notifications",
    "image": "assets/img/notification.png",
    "base": 15
  },

  {"index": "3", "name": "About Us", "image": "assets/img/info.png", "base": 0},
  {"index": "4", "name": "Logout", "image": "assets/img/logout.png", "base": 0},
];
List cardArr = [
  {
    "icon": "assets/img/Visa.png",
    "card": "**** **** **** 2187",
  }
];

final List<String> categoriesList = [
  'Offers',
  'Sandwiches',
  'Pasta',
  'Rice',
  'Salads',
  'Meals',
  'Tagen'
];
List notificationArr = [
  {
    "title": "Your orders has been picked up",
    "time": "Now",
  },
  {
    "title": "Your order has been delivered",
    "time": "1 h ago",
  },
  {
    "title": "Your orders has been picked up",
    "time": "3 h ago",
  },
  {
    "title": "Your order has been delivered",
    "time": "5 h ago",
  },
  {
    "title": "Your orders has been picked up",
    "time": "05 Jun 2023",
  },
  {
    "title": "Your order has been delivered",
    "time": "05 Jun 2023",
  },
  {
    "title": "Your orders has been picked up",
    "time": "06 Jun 2023",
  },
  {
    "title": "Your order has been delivered",
    "time": "06 Jun 2023",
  },
];

List aboutTextArr = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
];
