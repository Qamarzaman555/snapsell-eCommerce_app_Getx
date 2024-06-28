import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_category_model.dart';
import '../../features/shop/models/brands_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_category_model.dart';
import '../../routes/routes.dart';
import 'image_strings.dart';

class AppDummyData {
  // -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: AppImages.banner1, targetScreen: Routes.order, active: false),
    BannerModel(
        imageUrl: AppImages.banner2, targetScreen: Routes.cart, active: true),
    BannerModel(
        imageUrl: AppImages.banner3,
        targetScreen: Routes.favourites,
        active: true),
    BannerModel(
        imageUrl: AppImages.banner4, targetScreen: Routes.search, active: true),
    BannerModel(
        imageUrl: AppImages.banner5,
        targetScreen: Routes.settings,
        active: true),
    BannerModel(
        imageUrl: AppImages.banner6,
        targetScreen: Routes.userAddress,
        active: true),
    BannerModel(
        imageUrl: AppImages.banner8,
        targetScreen: Routes.checkout,
        active: false),
    BannerModel(
        imageUrl: AppImages.banner7, targetScreen: Routes.order, active: false),
  ];

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

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      image: AppImages.nikeLogo,
      name: 'Nike',
      productsCount: 265,
      isFeatured: true,
    ),
    BrandModel(
      id: '2',
      image: AppImages.adidasLogo,
      name: 'Adidas',
      productsCount: 95,
      isFeatured: true,
    ),
    BrandModel(
      id: '8',
      image: AppImages.kenwoodLogo,
      name: 'Kenwood',
      productsCount: 36,
      isFeatured: false,
    ),
    BrandModel(
      id: '9',
      image: AppImages.ikeaLogo,
      name: 'IKEA',
      isFeatured: false,
      productsCount: 36,
    ),
    BrandModel(
      id: '5',
      image: AppImages.appleLogo,
      name: 'Apple',
      productsCount: 16,
      isFeatured: true,
    ),
    BrandModel(
      id: '10',
      image: AppImages.acerlogo,
      name: 'Acer',
      productsCount: 36,
      isFeatured: false,
    ),
    BrandModel(
      id: '3',
      image: AppImages.jordanLogo,
      name: 'Jordan',
      productsCount: 36,
      isFeatured: true,
    ),
    BrandModel(
      id: '4',
      image: AppImages.pumaLogo,
      name: 'Puma',
      productsCount: 65,
      isFeatured: true,
    ),
    BrandModel(
      id: '6',
      image: AppImages.zaraLogo,
      name: 'ZARA',
      productsCount: 36,
      isFeatured: true,
    ),
    BrandModel(
      id: '7',
      image: AppImages.electronicsIcon,
      name: 'Samsung',
      productsCount: 36,
      isFeatured: false,
    ),
  ];

  /// -- List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),
    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),
    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),
    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),
    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),
    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),
    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),
    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    //040 after product 005
    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

  // / -- List of all Products
  // static final List<ProductModel> products = [];
}
