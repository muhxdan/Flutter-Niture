class FurnitureData {
  String name;
  String price;
  String image;
  String description;
  int totalReviews;
  double rating;

  FurnitureData({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.totalReviews,
    required this.rating,
  });
}

var furnitureList = [
  FurnitureData(
    name: "Black Simple Lamp",
    price: "12",
    image: "assets/images/img_black_lamp.png",
    description:
        "Enhance the ambiance of your living space with this sleek and modern black lamp. Its minimalistic design and premium build quality make it a perfect addition to any room. The soft, warm glow it provides adds elegance and sophistication to your home decor. Whether you place it on your bedside table, your desk, or in your living room, this lamp will not only illuminate your space but also serve as a stylish decorative element.",
    totalReviews: 76,
    rating: 4.4,
  ),
  FurnitureData(
    name: "Minimalist side table",
    price: "25",
    image: "assets/images/img_side_table.png",
    description:
        "This minimalist side table is a versatile and elegant piece of furniture that complements any room in your home. Its clean and simple design allows it to seamlessly blend with a variety of interior styles. Crafted with high-quality materials, this side table is both sturdy and stylish. Whether you use it to hold your books, display decorative items, or simply as a convenient surface for your coffee cup, it's a practical and beautiful addition to your living space.",
    totalReviews: 85,
    rating: 4.6,
  ),
  FurnitureData(
    name: "Jan Sflanaganvik sofa",
    price: "499",
    image: "assets/images/img_jan_sofa.png",
    description:
        "Experience the ultimate comfort and style with the Jan Sflanaganvik sofa. This premium sofa is designed for relaxation and luxury. Its plush cushions and ergonomic design provide exceptional comfort, making it the perfect centerpiece for your living room. Crafted with high-quality materials and attention to detail, this sofa not only offers a comfortable seating experience but also adds a touch of sophistication to your home decor. Whether you're entertaining guests or lounging with your family, this sofa is the epitome of modern elegance and comfort.",
    totalReviews: 127,
    rating: 4.7,
  ),
  FurnitureData(
    name: "Simple desk",
    price: "50",
    image: "assets/images/img_simple_desk.png",
    description:
        "This simple desk is a practical and versatile addition to your workspace. Its clean and functional design provides a dedicated place for you to focus and be productive. Crafted with durable materials, it can withstand the demands of your work or study routine. The ample workspace accommodates your computer, books, and other essentials, while the minimalist design fits seamlessly into any room. Whether you're working from home or need a dedicated study area, this desk offers both simplicity and functionality.",
    totalReviews: 54,
    rating: 4.5,
  ),
  FurnitureData(
    name: "Norrviken chair and table",
    price: "70",
    image: "assets/images/img_norrviken.png",
    description:
        "The Norrviken chair and table set is your go-to solution for outdoor relaxation. The comfortable chair and matching table are perfect for creating a cozy corner in your garden, patio, or balcony. Crafted from weather-resistant materials, they are designed to withstand the elements while providing you with a comfortable seating experience. Whether you want to enjoy a cup of coffee, read a book, or simply soak up the sun, this set offers both style and functionality for your outdoor space. The Norrviken chair and table set is your ticket to a tranquil outdoor retreat.",
    totalReviews: 43,
    rating: 4.6,
  ),
  FurnitureData(
    name: "Eames chair",
    price: "20",
    image: "assets/images/img_eames.png",
    description:
        "The iconic Eames chair is a timeless classic known for its exceptional design and comfort. This chair is a symbol of mid-century modern style and has remained popular for decades. Its ergonomically designed seat and sturdy construction make it not only a beautiful piece of furniture but also a practical and comfortable seating option. Whether you use it as a dining chair, an accent piece in your living room, or a stylish addition to your office, the Eames chair adds a touch of sophistication and luxury to your space.",
    totalReviews: 93,
    rating: 4.7,
  ),
];
