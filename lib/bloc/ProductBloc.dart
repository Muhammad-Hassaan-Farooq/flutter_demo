import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/bloc/ProductEvent.dart';
import 'package:flutter_demo/bloc/ProductState.dart';
import 'package:flutter_demo/models/product.dart';
import 'package:http/http.dart' as http;

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc():super(ProductInitial()){
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event,
      Emitter<ProductState> emit,
      ) async {

    emit(ProductLoading());

    try{

      final res = await http.get(Uri.parse("https://dummyjson.com/products"));

      if(res.statusCode == 200){
        List json = jsonDecode(res.body)['products'];
        List<Product> _products = json.map((product) => Product.fromJson(product)).toList();
        emit(ProductLoaded(_products));
      }
      else {
        throw Exception("Error loading products");
      }
    }
    catch(e){
      emit(ProductError('Error: $e'));
    }
  }
}