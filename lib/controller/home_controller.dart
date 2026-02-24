import 'package:cloudy_resturant/model/food_item.dart';
import 'package:uuid/uuid.dart';

class HomeController {
  final Uuid _uuid = Uuid();
   final List<FoodItem> _favorites = [];

  List<FoodItem> getFavoritesItems() {
    return _favorites;
  }

  void addToFavorites(FoodItem item) {
    if (!_favorites.any((favorite) => favorite.id == item.id)) {
      _favorites.add(item);
    }
  }

  void removeFromFavorites(FoodItem item) {
    _favorites.removeWhere((favorite) => favorite.id == item.id);
  }

  bool isFavorite(FoodItem item) {
    return _favorites.any((favorite) => favorite.id == item.id);
  }


  // Other methods (getOffers, getCategories, etc.) remain unchanged



  List<FoodItem> getOffers() {
    return [
      FoodItem(
        id: _uuid.v4(),
        name: 'بيتزا خضار',
        imageUrl: 'assets/images/adspic.png',
        price: 3200,
        description: 'بيتزا خضار كبيرة مع مزيج من الجبن والخضروات الطازجة.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: "كيك",
        imageUrl: 'assets/images/cake.png',
        price: 2800,
        description: 'كيك شوكولاتة غني مغطى بطبقة من الكريمة اللذيذة.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: "سلطة",
        imageUrl: 'assets/images/cheesesandwich.png',
        price: 1700,
        description: 'سلطة طازجة مكونة من الخضروات الموسمية مع تتبيلة خاصة.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: "جاتو",
        imageUrl: 'assets/images/pancake.png',
        price: 2900,
        description: 'جاتو فاخر بنكهات متعددة ومغطى بالكريمة.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: "ستيك",
        imageUrl: 'assets/images/steak.png',
        price: 1100,
        description: 'ستيك لحم مشوي بشكل مثالي مع توابل خاصة.',
      ),
    ];
  }

  List<FoodItem> getCategories() {
    return [
      FoodItem(
        id: _uuid.v4(),
        name: 'عشاء',
        imageUrl: 'assets/images/dinnerCatogory.png',
        price: 0,
        description: 'وجبات مخصصة لفترة المساء بمذاق شهي.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'غداء',
        imageUrl: 'assets/images/lunchCatogory.png',
        price: 0,
        description: 'وجبات غداء غنية بالنكهات والطاقة.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'فطور',
        imageUrl: 'assets/images/breakfastCatogory.png',
        price: 0,
        description: 'وجبات فطور لذيذة تبدأ بها يومك.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'طعام صحي',
        imageUrl: 'assets/images/healthypic.png',
        price: 0,
        description: 'خيارات غذائية صحية تناسب نمط حياتك.',
      ),
    ];
  }

  List<FoodItem> getRecommendations() {
    return [
      FoodItem(
        id: _uuid.v4(),
        name: 'معكرونة',
        imageUrl: 'assets/images/pasta.png',
        price: 2700,
        description: 'معكرونة إيطالية لذيذة مع صلصة طماطم غنية.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'ساندويتش جبن',
        imageUrl: 'assets/images/cheesesandwich.png',
        price: 700,
        description: 'ساندويتش جبن ساخن مع خبز طازج ومكونات شهية.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'كروسان وقهوة',
        imageUrl: 'assets/images/corrsiant.png',
        price: 1000,
        description: 'كروسان طازج مع فنجان قهوة لتحسين يومك.',
      ),
    ];
  }

  List<FoodItem> getHealthyFoods() {
    return [
      FoodItem(
        id: _uuid.v4(),
        name: 'سلطة',
        price: 500,
        imageUrl: 'assets/images/salad.png',
        description: 'سلطة صحية مليئة بالفيتامينات والعناصر المغذية.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'دجاج مشوي',
        price: 1200,
        imageUrl: 'assets/images/grilledcheckin.png',
        description: 'دجاج مشوي مع تتبيلة خاصة للحفاظ على الصحة.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'سموذي',
        price: 700,
        imageUrl: 'assets/images/smoothie.png',
        description: 'سموذي طازج مكون من الفواكه الطبيعية.',
      ),
    ];
  }

  List<FoodItem> getBreakfastItems() {
    return [
      FoodItem(
        id: _uuid.v4(),
        name: 'فول',
        price: 500,
        imageUrl: 'assets/images/foul.png',
        description: 'طبق فول يمني تقليدي مع زيت الزيتون.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'بيض',
        price: 300,
        imageUrl: 'assets/images/eggs.png',
        description: 'بيض طازج مطهو بطريقة تقليدية.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'بريوش',
        price: 800,
        imageUrl: 'assets/images/omlet.png',
        description: 'بريوش غني مع لمسة من الزبدة.',
      ),
      FoodItem(
        id: _uuid.v4(),
        name: 'كروسان',
        imageUrl: 'assets/images/corrsiantMeal.png',
        price: 500,
        description: 'كروسان هش ومخبوز يومياً.',
      ),
    ];
  }
List<FoodItem> getLunchItems() {
  return [
    FoodItem(
      id: _uuid.v4(),
      name: 'دجاج مشوي',
      price: 2500,
      imageUrl: 'assets/images/grilledcheckin.png',
      description: 'دجاج مشوي بتتبيلة خاصة ومذاق لذيذ.',
    ),
    FoodItem(
      id: _uuid.v4(),
      name: 'مكرونة',
      price: 1800,
      imageUrl: 'assets/images/whitepasta.png',
      description: 'مكرونة طازجة تقدم مع صوص كريمي غني.',
    ),
    FoodItem(
      id: _uuid.v4(),
      name: 'برغر لحم',
      price: 1500,
      imageUrl: 'assets/images/meatburger.png',
      description: 'برغر لحم مشوي مع الخضروات والجبن.',
    ),
    FoodItem(
      id: _uuid.v4(),
      name: 'سلطة يونانية',
      price: 1200,
      imageUrl: 'assets/images/greeksalad.png',
      description: 'سلطة منعشة مكونة من الخضروات والجبن الفيتا والزيتون.',
    ),
  ];
}

List<FoodItem> getDinnerItems() {
  return [
    FoodItem(
      id: _uuid.v4(),
      name: 'سلطة الكينوا ',
      price: 1500,
      imageUrl: 'assets/images/salad3.png',
      description: 'سلطة مغذية تحتوي على الكينوا والخضروات الطازجة مع زيت الزيتون.',
    ),
    FoodItem(
      id: _uuid.v4(),
      name: 'شوربة ',
      price: 1000,
      imageUrl: 'assets/images/soup.png',
      description: 'شوربة لذيذة مصنوعة من العدس الأحمر والتوابل الشرقية.',
    ),
    FoodItem(
      id: _uuid.v4(),
      name: 'ساندويتش  ',
      price: 500,
      imageUrl: 'assets/images/beefburger.png',
      description: 'ساندويتش يحتوي على دجاج مشوي مع الخضار الطازجة وصلصة الزبادي.',
    ),
   
    FoodItem(
      id: _uuid.v4(),
      name: 'سمك السلمون ',
      price: 3500,
      imageUrl: 'assets/images/salmon.png',
      description: 'سمك سلمون مشوي متبل يقدم مع خضروات مشوية لذيذة.',
    ),
  ];
}


}
