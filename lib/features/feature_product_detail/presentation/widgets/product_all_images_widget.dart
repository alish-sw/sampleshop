import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navasan/core/utils/constants.dart';


import '../../domain/entity/product_all_images_entity.dart';
import '../bloc/products_all_images_status.dart';
import '../bloc/products_detail_bloc.dart';

class ProductAllImagesWidget extends StatefulWidget{
  final int pId;
  ProductAllImagesWidget({required this.pId});

  @override
  State<StatefulWidget> createState() =>_productAllImagesWidgetState(pId);



  }
class _productAllImagesWidgetState extends State<ProductAllImagesWidget> {
  final int pId;
  _productAllImagesWidgetState(this.pId);
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ProductsDetailBloc>(context).add(ProductAllImagesEvents(pId));

  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.zero,
      ),
      child:BlocBuilder<ProductsDetailBloc,ProductsDetailState>
        (
        //bloc: BlocProvider.of<ProductsDetailBloc>(context),
          buildWhen: (previous,current)
          {
            if(current.productAllImagesStatus==previous.productAllImagesStatus)
              return false;
            else
              return true;
          },
          builder: (context,state)
          {
            if(state.productAllImagesStatus is ProductAllImagesLoading)
            {
              //BlocProvider.of<ProductsDetailBloc>(context).add(ProductDetailEvents(PId));
              return const Center(
                  child:CircularProgressIndicator()

              );
            }
            if(state.productAllImagesStatus is ProductsAllImagesCompleted)
            {
              final ProductsAllImagesCompleted Pdcompleted=state.productAllImagesStatus as ProductsAllImagesCompleted;
              ProductAllImgaesEntity productallimages=Pdcompleted.allImagesEntity;
              ///print(productallimages.productimages.toString());
              ///List<ProductImagesEntity>? listofimages=productallimages.allImages;
              return (productallimages.productimages!.isEmpty)
                  ? Center(
                child: Text(
                  'no more images',
                  style: TextStyle(color: Colors.black),
                ),
              )
                  : ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  ///***If you have exported images you must have to copy those images in assets/images directory.
                  Image(
                    image: NetworkImage(productallimages.productimages==null?"${Constants.baseimageurl}nomore.png":Constants.baseimageurl+productallimages.productimages![0].name!),
                    height: 30,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    Image(
                      image: NetworkImage(
                          productallimages.productimages==null?"${Constants.baseimageurl}nomore.png":Constants.baseimageurl+productallimages.productimages![1].name!),
                      height: 60,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    Image(
                      image: NetworkImage(
                          productallimages.productimages==null?"${Constants.baseimageurl}nomore.png":Constants.baseimageurl+productallimages.productimages![2].name!),
                      height: 60,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    Image(
                      image: NetworkImage(
                          productallimages.productimages==null?"${Constants.baseimageurl}nomore.png":Constants.baseimageurl+productallimages.productimages![3].name!),
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            }
            if(state.productAllImagesStatus is ProductsAllImagesError)
            {
              final ProductsAllImagesError fwError = state.productDetailStatus as ProductsAllImagesError;
              return  Center(
                  child:Text(fwError.message));
            }
            return Container();
          }
      ),
    );
  }


}


