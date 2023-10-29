import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navasan/features/feature_home/presentation/widgets/product_list_view.dart';

import '../../../../locator.dart';
import '../../../feature_product_detail/presentation/bloc/products_detail_bloc.dart';
import '../../data/models/Productsmodel.dart';
import '../../domain/entity/products_entitiy.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_products_state.dart';

class ProductsList extends StatefulWidget
{
  //final String productName;
  final String productName;
  ProductsList({Key ? key,required this.productName}):super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<ProductsList> {
  ///final String pName;

  final pageController = PageController();
  ///GetAllCategoryUseCase _getAllCategoryUseCase=GetAllCategoryUseCase(locator());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //BlocProvider.of<HomeBloc>(context).add(HomeProductEvent());
    BlocProvider.of<HomeBloc>(context).add(HomeProductEvent(widget.productName));
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      appBar:
      AppBar(
        elevation:4,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xffffffff),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "Listing",
          style:TextStyle(
            fontWeight:FontWeight.w700,
            fontStyle:FontStyle.normal,
            fontSize:18,
            color:Color(0xff000000),
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon( Icons.arrow_back,color: Colors.black, )),
      ),
      body:Scaffold(
   backgroundColor: Color(0xffe2e5e7),

   body:BlocBuilder<HomeBloc, HomeState>(
     buildWhen: (previous, current) {
       /// rebuild UI just when allCityStatus Changed
       if (current.homeProductsState== previous.homeProductsState) {
         return false;
       } else {
         return true;
       }
     },
     builder: (context, state) {
       /// show Loading for AllCityStatus
       if (state.homeProductsState is HomeProductsLoading) {
         return Center(
           child: CircularProgressIndicator(),
         );
       }
       /// show Completed for AllCityStatus
       if (state.homeProductsState is HomeProductsCompleted) {
         /// casting for getting cities
         final HomeProductsCompleted g = state.homeProductsState as HomeProductsCompleted;
         ProductsEntity allproducts = g.productsEntity;
         List<Products> products=allproducts.products!;
         return (products.isEmpty)
             ? Center(
           child: Text(
             'No Any Product',
             style: TextStyle(color: Colors.white),
           ),
         )
             :  ListView.builder(
           scrollDirection: Axis.vertical,
           padding:EdgeInsets.all(8),
           shrinkWrap:true,
           physics:ClampingScrollPhysics(),
           itemCount: products.length,
           itemBuilder: (BuildContext context,
               int index,) {
             return  ProductListView(
               product: products[index],);
           },);
       }
       if (state.homeProductsState is HomeProductsError) {
         final HomeProductsError fwError = state.homeProductsState as HomeProductsError;
         return Center(
           child: Text(fwError.message!),
         );
       }
       return Container();
     },
   ),

    ),)
    ;}
}