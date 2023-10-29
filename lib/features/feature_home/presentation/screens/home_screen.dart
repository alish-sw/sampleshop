

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:navasan/features/feature_home/data/models/Category_model.dart';
import 'package:navasan/features/feature_home/domain/entity/category_entity.dart';
import 'package:navasan/features/feature_home/domain/entity/products_entitiy.dart';
import 'package:navasan/features/feature_home/presentation/bloc/home_category_status.dart';
import 'package:navasan/features/feature_home/presentation/screens/products_list.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/bloc/bottom_icon_cubit.dart';
import '../../../../core/utils/constants.dart';
import '../../../../locator.dart';
import '../../../feature_product_detail/presentation/bloc/products_detail_bloc.dart';
import '../../data/models/Productsmodel.dart';
import '../../domain/use_cases/get_all_products_usecase.dart';
import '../../domain/use_cases/get_suggest_products_usecase.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_products_state.dart';
import '../widgets/category_view.dart';
import '../widgets/product_view.dart';


class HomeScreen extends StatefulWidget {
  late PageController pageController;
 HomeScreen({Key? key,required this.pageController}) : super(key: key);


 @override
 _HomeScreenState createState() => _HomeScreenState( pageController: this.pageController);
}
class _HomeScreenState extends State<HomeScreen> {

  late PageController pageController;
  _HomeScreenState({required this.pageController});
  ///late LinkedScrollControllerGroup _controllers;
  ///late ScrollController _letters;
  PageController newPageController=new PageController();
 GetSuggestProductsUseCase getSuggestProductsUseCase=GetSuggestProductsUseCase(locator());
 ///GetAllCategoryUseCase _getAllCategoryUseCase=GetAllCategoryUseCase(locator());
 @override
 void initState() {
  // TODO: implement initState
  super.initState();
  //_controllers = LinkedScrollControllerGroup();
  //_letters = _controllers.addAndGet();
  BlocProvider.of<HomeBloc>(context).add(HomeProductEvent(""));
  BlocProvider.of<HomeBloc>(context).add(HomeCategoryEvent());
 }

 TextEditingController textEditingController = TextEditingController();
 Widget build(BuildContext context) {
   final height = MediaQuery.of(context).size.height;
   final width = MediaQuery.of(context).size.width;
  return  Scaffold(
   backgroundColor: Color(0xffe2e5e7),

   body: SingleChildScrollView(
    child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisSize: MainAxisSize.max,
     children: [
      Stack(
       alignment: Alignment.topLeft,
       children: [
        Container(
         margin: EdgeInsets.all(0),
         padding: EdgeInsets.all(0),
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height * 0.4,
         decoration: BoxDecoration(
          color: Color(0xff3a57e8),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
         ),
        ),
        Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.max,
         children: [
          Padding(
           padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
               Text(
                "ALISH_SW",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                 fontWeight: FontWeight.w700,
                 fontStyle: FontStyle.normal,
                 fontSize: 22,
                 color: Color(0xffffffff),
                ),
               ),
               Text(
                "SHOP",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                 fontWeight: FontWeight.w700,
                 fontStyle: FontStyle.normal,
                 fontSize: 22,
                 color: Color(0xfffba808),
                ),
               ),
              ],
             ),
             Icon(
              Icons.dashboard,
              color: Color(0xffffffff),
              size: 20,
             ),
            ],
           ),
          ),
          Padding(
           padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
             Icon(
              Icons.location_on,
              color: Color(0xffffffff),
              size: 20,
             ),
             Padding(
              padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: Text(
               "TEHRAN",
               textAlign: TextAlign.start,
               overflow: TextOverflow.clip,
               style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xffffffff),
               ),
              ),
             ),
            ],
           ),
          ),
          Padding(
           padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
           child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                              onSubmitted: (String prefix) {
                                textEditingController.text = prefix;
                                BlocProvider.of<HomeBloc>(context)
                                    .add(HomeProductEvent(prefix));
                              },
                              controller: textEditingController,
                              style: DefaultTextStyle.of(context).style.copyWith(
                                    fontSize: height * 0.02,
                                    color: Colors.white,
                                  ),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, height * 0.02, 0, height * 0.02),
                                hintText: "Enter a Product Name...",
                                hintStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),),
                          suggestionsCallback: (String prefix) async {
                            return getSuggestProductsUseCase(prefix);
                          },
                          itemBuilder: (context, Products model) {
                            return ListTile(
                              leading: Image(
                                image:NetworkImage(Constants.baseimageurl+model.image!),
                                height:40,
                                width:40,
                                fit:BoxFit.cover,
                              ),
                              title: Text(model.name!),
                              //subtitle: Text("${model.region!}, ${model.country!}"),
                            );
                          },
                          onSuggestionSelected: (Products model) {
                            textEditingController.text = model.name!;
                            ///ProductsList();
                            Navigator.of(context).push(
                              MaterialPageRoute<ProductsList>(
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<HomeBloc>(context),
                                  child:BlocProvider(create: (_) => locator<ProductsDetailBloc>(),
                                  child:ProductsList(productName: model.name!,),
                                ),
                              ),
                            ),);
                          },
                        ),
          ),
          SizedBox(
           height: MediaQuery.of(context).size.height * 0.3,
           child: Stack(
            children: [
             PageView.builder(
              controller: newPageController,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, position) {
               return Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: ClipRRect(
                 borderRadius: BorderRadius.circular(12.0),
                 child: Image.network(
                  Constants.basemainimageurl+"test.png",
                  height: 300,
                  width: 200,
                  fit: BoxFit.cover,
                 ),
                ),
               );
              },
             ),
             Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
               controller: newPageController,
               count: 3,
               axisDirection: Axis.horizontal,
               effect: WormEffect(
                dotColor: Color(0xff9e9e9e),
                activeDotColor: Color(0xff3f51b5),
                dotHeight: 12,
                dotWidth: 12,
                radius: 16,
                spacing: 8,
               ),
              ),
             ),
            ],
           ),
          ),
         ],
        ),
       ],
      ),
      Padding(
       padding: EdgeInsets.all(16),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
         Text(
          "Popular",
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
           fontWeight: FontWeight.w700,
           fontStyle: FontStyle.normal,
           fontSize: 16,
           color: Color(0xff000000),
          ),
         ),

        ],
       ),
      ),
      Container(
       margin: EdgeInsets.all(0),
       padding: EdgeInsets.all(0),
       height: 100,
       decoration: BoxDecoration(
        color: Color(0x1fffffff),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.zero,
       ),
       child: BlocBuilder<HomeBloc, HomeState>(
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
                              'No Any New Product',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        :  ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      //shrinkWrap: true,
                                      //scrollDirection: Axis.horizontal,
                                      itemCount: products.length,
                                      itemBuilder: (BuildContext context,
                                          int index,) {
                                        return ProductView(
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
      ),

      Padding(
       padding: EdgeInsets.all(16),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
         Text(
          "Categories",
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
           fontWeight: FontWeight.w700,
           fontStyle: FontStyle.normal,
           fontSize: 16,
           color: Color(0xff000000),
          ),
         ),

        ],
       ),
      ),

      Center(
     child:BlocBuilder<HomeBloc, HomeState>(
       buildWhen: (previous, current) {
        /// rebuild UI just when allCityStatus Changed
        if (current.homeCategoryStatus== previous.homeCategoryStatus) {
         return false;
        } else {
         return true;
        }
       },
       builder: (context, state) {
        /// show Loading for AllCityStatus
        if (state.homeCategoryStatus is HomeCategoryLoading) {
         return const Center(
          child: CircularProgressIndicator(),
         );
        }
        /// show Completed for AllCityStatus
        if (state.homeCategoryStatus is HomeCategoryCompleted) {
         /// casting for getting cities
         final HomeCategoryCompleted g = state.homeCategoryStatus as HomeCategoryCompleted;
         CategoryEntity allcategory= g.categoryEntity;
         List<Categories> category=allcategory.categories!;
         return (category.isEmpty)
             ? Center(
          child: Text(
           'No Any Category',
           style: TextStyle(color: Colors.white),
          ),
         )
             :  GridView.builder(
       padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
       shrinkWrap: true,
       scrollDirection: Axis.vertical,
       physics: NeverScrollableScrollPhysics(),
       itemCount: category.length,
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
       ),itemBuilder: (BuildContext context,
         int index,) {
       return CategoryView(
        c: category[index]);}
      );}

        if (state.homeProductsState is HomeCategoryError) {
         final HomeCategoryError fwError = state.homeCategoryStatus as HomeCategoryError;
         return Center(
          child: Text(fwError.message!),
         );
        }
        return Container();
       },
      ),

    ),
     ],
    ),
   ),
  );
 }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    //_letters.dispose();
    super.dispose();
  }
}
