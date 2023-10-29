import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:navasan/core/utils/constants.dart';
import 'package:navasan/features/feature_product_detail/presentation/bloc/product_detail_status.dart';
import 'package:navasan/features/feature_product_detail/presentation/bloc/products_detail_bloc.dart';

import '../../../../locator.dart';

import '../../domain/entity/product_detail_entity.dart';
import '../widgets/product_all_images_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState(productId);



}
class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final int PId;
  _ProductDetailScreenState(this.PId);
  @override
  void initState() {
  // TODO: implement initState
  super.initState();
  print(PId);
  BlocProvider.of<ProductsDetailBloc>(context).add(ProductDetailEvents(PId));
  }
  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    BlocProvider.of<ProductsDetailBloc>(context).dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xff000000),
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon( Icons.arrow_back,color: Colors.black, )),

      ),
      body:
      BlocBuilder<ProductsDetailBloc,ProductsDetailState>
          (
          //bloc: BlocProvider.of<ProductsDetailBloc>(context),
            buildWhen: (previous,current)
            {
              if(current.productDetailStatus==previous.productDetailStatus)
                return false;
              else
                return true;
            },
            builder: (context,state)
            {
              if(state.productDetailStatus is ProductDetailLoading)
              {
                //BlocProvider.of<ProductsDetailBloc>(context).add(ProductDetailEvents(PId));
                return const Center(
                    child:CircularProgressIndicator()

                );
              }
              if(state.productDetailStatus is ProductDetailCompleted)
              {
                final ProductDetailCompleted Pdcompleted=state.productDetailStatus as ProductDetailCompleted;
                ProductDetailEntity productDetail=Pdcompleted.productDetailEntity;
                return (productDetail==null)
                    ? Center(
                  child: Text(
                    'Cant load product detail',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                    : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child:

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        Image(
                          image: NetworkImage(
                              Constants.baseimageurl+productDetail.image!),
                          height:
                          MediaQuery.of(context).size.height * 0.35000000000000003,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ProductAllImagesWidget(pId:productDetail.id!),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              productDetail.name!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                            RatingBar.builder(
                              initialRating: 2.75,
                              unratedColor: Color(0xff9e9e9e),
                              itemBuilder: (context, index) =>
                                  Icon(Icons.star, color: Color(0xffffc107)),
                              itemCount: 5,
                              itemSize: 16,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              onRatingUpdate: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text(
                          productDetail.description!,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            productDetail.price!.toString(),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            onPressed: () {},
                            color: Color(0xff3a57e8),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            textColor: Color(0xffffffff),
                            height: 40,
                            minWidth: 140,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if(state.productDetailStatus is ProductDetailError)
              {
                final ProductDetailError fwError = state.productDetailStatus as ProductDetailError;
                return  Center(
                    child:Text(fwError.message));
              }
              return Container();
            }
        ),
      );

      ///***If you have exported images you must have to copy those images in assets/images directory.




  }

  }