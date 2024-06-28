import '../../../features/shop/models/category_model.dart';
import '../../../utils/constants/image_strings.dart';

class AppDummyData {
  /// -- Banners
  // static final List<BannerModel> banners = [
  //   BannerModel(
  //       imageUrl: AppImages.banner1,
  //       targetScreen: AppRoutes.order,
  //       active: false),
  //   BannerModel(
  //       imageUrl: AppImages.banner2,
  //       targetScreen: AppRoutes.cart,
  //       active: true),
  //   BannerModel(
  //       imageUrl: AppImages.banner3,
  //       targetScreen: AppRoutes.favourites,
  //       active: true),
  //   BannerModel(
  //       imageUrl: AppImages.banner4,
  //       targetScreen: AppRoutes.search,
  //       active: true),
  //   BannerModel(
  //       imageUrl: AppImages.banner5,
  //       targetScreen: AppRoutes.setting,
  //       active: true),
  //   BannerModel(
  //       imageUrl: AppImages.banner6,
  //       targetScreen: AppRoutes.userAddress,
  //       active: true),
  //   BannerModel(
  //       imageUrl: AppImages.banner8,
  //       targetScreen: AppRoutes.chechout,
  //       active: false),
  //   BannerModel(
  //       imageUrl: AppImages.banner7,
  //       targetScreen: AppRoutes.order,
  //       active: false),
  // ];

  /// -- User
  // static final UserModel user = UserModel(
  //     id: id,
  //     firstName: firstName,
  //     lastName: lastName,
  //     username: username,
  //     email: email,
  //     phoneNumber: phoneNumber,
  //     profilePicture: profilePicture);

  /// -- Cart
  /// -- Order
  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: AppImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(
        id: '5',
        image: AppImages.furnitureIcon,
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: AppImages.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '3', image: AppImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '4',
        image: AppImages.animalIcon,
        name: 'Animals',
        isFeatured: true),
    CategoryModel(
        id: '6', image: AppImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '7',
        image: AppImages.cosmeticsIcon,
        name: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: AppImages.jeweleryIcon,
        name: 'Jewelery',
        isFeatured: true),

    /// Subcategories
    // Sports
    CategoryModel(
        id: '8',
        image: AppImages.sportIcon,
        name: 'Sports Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        image: AppImages.sportIcon,
        name: 'Track Suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: AppImages.sportIcon,
        parentId: '1',
        name: 'Sports Equipments',
        isFeatured: false),

    // Furniture
    CategoryModel(
        id: '11',
        image: AppImages.furnitureIcon,
        parentId: '5',
        name: 'Bedroom furniture',
        isFeatured: false),
    CategoryModel(
        id: '12',
        image: AppImages.furnitureIcon,
        parentId: '5',
        name: 'Kitchen furniture',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: AppImages.furnitureIcon,
        parentId: '5',
        name: 'Office furniture',
        isFeatured: false),

    // Electronics
    CategoryModel(
        id: '14',
        image: AppImages.electronicsIcon,
        parentId: '2',
        name: 'Laptop',
        isFeatured: false),
    CategoryModel(
        id: '15',
        image: AppImages.electronicsIcon,
        parentId: '2',
        name: 'Mobile',
        isFeatured: false),

    // Animals
    CategoryModel(
        id: '16',
        image: AppImages.animalIcon,
        parentId: '4',
        name: 'Cat Food',
        isFeatured: false),
    CategoryModel(
        id: '17',
        image: AppImages.animalIcon,
        parentId: '4',
        name: 'Dog Food',
        isFeatured: false),

    // Sports
    CategoryModel(
        id: '18',
        image: AppImages.shoeIcon,
        parentId: '6',
        name: 'Football Shoes',
        isFeatured: false),
    CategoryModel(
        id: '19',
        image: AppImages.shoeIcon,
        parentId: '6',
        name: 'Cricket Shoes',
        isFeatured: false),

    // Cosmetics
    CategoryModel(
        id: '20',
        image: AppImages.cosmeticsIcon,
        parentId: '7',
        name: 'Mackup',
        isFeatured: false),
    CategoryModel(
        id: '21',
        image: AppImages.cosmeticsIcon,
        parentId: '7',
        name: 'Dresses',
        isFeatured: false),

    // Jewelery
    CategoryModel(
        id: '22',
        image: AppImages.jeweleryIcon,
        parentId: '14',
        name: 'Necklace',
        isFeatured: false),
    CategoryModel(
        id: '23',
        image: AppImages.jeweleryIcon,
        parentId: '14',
        name: 'Bangles',
        isFeatured: false),
  ];
}
