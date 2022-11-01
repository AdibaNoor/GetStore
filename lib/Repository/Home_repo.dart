import 'package:getstore/Models/ProductsModel.dart';
import 'package:getstore/Utils/constants.dart';
import 'package:getstore/data/network/baseApiServices.dart';
import 'package:getstore/data/network/networkApiServices.dart';

class HomeRepository{
  BaseApiService _apiservice = NetworkService();

  Future<ProductModel> GetProductApi() async{
    try{
      dynamic response = await _apiservice.getGetApiResponse(AppUrls.productsEndPoint);
      return response = ProductModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}