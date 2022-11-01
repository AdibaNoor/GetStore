import 'package:flutter/cupertino.dart';
import 'package:getstore/Models/ProductsModel.dart';
import 'package:getstore/Repository/Home_repo.dart';
import 'package:getstore/data/response.dart';

class HomeViewViewModel with ChangeNotifier{
  final _myRepo = HomeRepository();

  ApiResponse<ProductModel> productlist = ApiResponse.loading();

  setProductList(ApiResponse<ProductModel> response){
    productlist = response;
    notifyListeners();
  }
  Future<void> fetchProduct () async{
    setProductList(ApiResponse.loading());
    _myRepo.GetProductApi().then((value){
      setProductList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
    });
  }
}