

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navasan/core/utils/constants.dart';
import 'package:navasan/features/feature_product_detail/presentation/bloc/products_detail_bloc.dart';
import 'package:navasan/features/feature_product_detail/presentation/screens/product_detail_screen.dart';

import '../../../../locator.dart';
import '../../data/models/Productsmodel.dart';

class ProductListView extends StatefulWidget{
  final Products product;
  ProductListView({Key? key, required this.product}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_productListViewState(product.id!);

}
class _productListViewState extends State<ProductListView>{
  @override
  final int PId;
  _productListViewState(this.PId);
  void initState() {
    // TODO: implement initState

    super.initState();

    ///BlocProvider.of<ProductsDetailBloc>(context).add(ProductDetailEvents(PId));

  }
  @override
  Widget build(BuildContext context) {
    ///BlocProvider<ProductsDetailBloc>(create: (_) => locator<ProductsDetailBloc>());
    return
    GestureDetector(

        onTap: () {
           Navigator.of(context).push(
               MaterialPageRoute<ProductDetailScreen>(
                 builder: (_) => BlocProvider(
                   create: (_) => locator<ProductsDetailBloc>() ,
                   child: ProductDetailScreen(productId: PId!),

                 ),
              ),
           );
          // Navigator.of(context).push(
          //   MaterialPageRoute<ProductDetailScreen>(
          //     builder: (_) => BlocProvider.value(
          //       value: BlocProvider.of<ProductsDetailBloc>(context),
          //       child: ProductDetailScreen(productId: PId!),
          //     ),
          //   ),
          // );

    },
    child: Card(
      margin:EdgeInsets.all(0),
      color:Color(0xffffffff),
      shadowColor:Color(0xff000000),
      elevation:1,
      shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(12.0),
      ),
      child:
      Row(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisSize:MainAxisSize.min,
        children:[

          ClipRRect(
            borderRadius:BorderRadius.only(topLeft: Radius.circular(12.0), bottomLeft: Radius.circular(12.0)),
            child:
            ///***If you have exported images you must have to copy those images in assets/images directory.
            Image(
              image:NetworkImage(Constants.baseimageurl+widget.product.image!),
              height:130,
              width:100,
              fit:BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:EdgeInsets.all(8),
              child:
              Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisSize:MainAxisSize.max,
                children: [
                  Padding(padding:EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    widget.product.name!,
                    textAlign: TextAlign.start,
                    maxLines:1,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w700,
                      fontStyle:FontStyle.normal,
                      fontSize:16,
                      color:Color(0xff000000),
                    ),
                  ),
                  ),
                  Padding(
                    padding:EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child:Text(
                      "\$"+widget.product.price!.toString(),
                      textAlign: TextAlign.start,
                      maxLines:2,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w700,
                        fontStyle:FontStyle.normal,
                        fontSize:18,
                        color:Color(0xff000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child:Text(
                      "Stock:"+widget.product.stock.toString(),
                      textAlign: TextAlign.start,
                      maxLines:2,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w400,
                        fontStyle:FontStyle.normal,
                        fontSize:11,
                        color:Color(0xff000000),
                      ),
                    ),
                  ),
                ],),),),
          Padding(
            padding:EdgeInsets.all(8),
            child:Icon(
              Icons.more_vert,
              color:Color(0xff212435),
              size:24,
            ),
          ),
         
        ],),
    ),);
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

}