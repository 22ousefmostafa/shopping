import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/features/home/data/models/product_model.dart';

import '../../data/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository = HomeRepository();
  HomeCubit() : super(HomeInitial());

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    try {
      final products = await repository.getProducts();
      final categories = await repository.getCategories();
      emit(
        HomeLoaded(
          products: products.isEmpty ? getDummyProducts() : products,
          categories: categories.isEmpty
              ? ['Miscellaneous', 'Shoes', 'Furniture', 'Electronics']
              : categories,
        ),
      );
    } catch (e) {
      // Fallback local data if backend server is sleeping
      emit(
        HomeLoaded(
          products: getDummyProducts(),
          categories: const [
            'Miscellaneous',
            'Shoes',
            'Furniture',
            'Electronics',
          ],
        ),
      );
    }
  }

  static List<ProductModel> getDummyProducts() {
    return [
      ProductModel(
        id: '1',
        title: 'T-shirt oversize',
        price: 199,
        discountPrice: 250,
        rating: 4.5,
        image:
            'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500',
      ),
      ProductModel(
        id: '2',
        title: 'T-shirt oversize',
        price: 199,
        discountPrice: 250,
        rating: 4.5,
        image:
            'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=500',
      ),
      ProductModel(
        id: '3',
        title: 'T-shirt oversize',
        price: 199,
        discountPrice: 250,
        rating: 4.5,
        image:
            'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?w=500',
      ),
      ProductModel(
        id: '4',
        title: 'T-shirt oversize',
        price: 199,
        discountPrice: 250,
        rating: 4.5,
        image:
            'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=500',
      ),
    ];
  }
}
