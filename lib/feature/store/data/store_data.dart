import '../model/models.dart';

final List<Category> mockCategories = [
  Category(
    name: "Dairy & Eggs",
    image: "assets/images/dairy&egg.png",
    subCategories: [
      SubCategory(
        name: "Milk",
        products: [
          Product(id: "p1", name: "Lactaid Fat Free", image: "assets/images/lactaidfate.png", price: 15, weight: "20 mg"),
          Product(id: "p2", name: "Lactaid Whole", image: "assets/images/lactaidwhole.png", price: 35, weight: "22 mg"),
          Product(id: "p3", name: "Organic Valley", image: "assets/images/lactaidwhole.png", price: 38, weight: "25 mg"),
         ],
      ),
      SubCategory(
        name: "Ice cream",
        products: [
          Product(id: "p4", name: "Birthday Special", image: "assets/images/birthdayspecial.jpg", price: 70, weight: "70 mg"),
          Product(id: "p5", name: "Purple Yam", image: "assets/images/purpleyarm.png", price: 35, weight: "20 mg"),
        ],
      ),
    ],
  ),
  Category(
    name: "Snacks",
    image: "assets/images/snacks.png",
    subCategories: [
      SubCategory(
        name: "Chips",
        products: [
          Product(id: "p6", name: "Classic Lays", image: "assets/images/lays.jpg", price: 5, weight: "30 mg"),
          Product(id: "p7", name: "Spicy Doritos", image: "assets/images/doritos.jpg", price: 7, weight: "32 mg"),
        ],
      ),

      SubCategory(
        name: "Cookies",
        products: [
          Product(id: "p8", name: "Choco Chip", image: "assets/images/chocochips.jpg", price: 12, weight: "50 mg"),
          Product(id: "p9", name: "Oatmeal Raisin", image: "assets/images/oatmeal.jpg", price: 10, weight: "45 mg"),
        ],
      ),
    ],
  ),
  Category(
    name: "Seafood",
    image: "assets/images/seafood.png",
    subCategories: [
      SubCategory(
        name: "Fresh Fish",
        products: [
          Product(id: "p10", name: "Salmon Fillet", image: "🐟", price: 50, weight: "100 g"),
        ],
      ),
    ],
  ),
  Category(
    name: "Frozen Foods",
    image: "assets/images/frozen.png",
    subCategories: [
      SubCategory(
        name: "Pizza",
        products: [
          Product(id: "p12", name: "Pepperoni Pizza", image: "🍕", price: 25, weight: "200 g"),
        ],
      ),
    ],
  ),
];