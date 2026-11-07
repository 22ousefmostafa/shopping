import '../../../core/api/api_client.dart';
import '../../../core/constants/api_constants.dart';
import 'models/product_model.dart';

class HomeRepository {
  final ApiClient apiClient = ApiClient();

  Future<List<ProductModel>> getProducts() async {
    final response = await apiClient.dio.get(ApiConstants.products);
    final List data = response.data['data'] ?? response.data['products'] ?? [];
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }

  Future<List<String>> getCategories() async {
    final response = await apiClient.dio.get(ApiConstants.categories);
    final List data = response.data['data'] ?? [];
    return data.map((item) => item.toString()).toList();
  }
}
