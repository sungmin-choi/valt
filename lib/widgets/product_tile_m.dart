import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valt/auth/auth_first_page.dart';
import 'package:valt/model/product.dart';
import 'package:valt/screens/product_detail.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/service/network_handler/product_service.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ProductTileM extends StatefulWidget {
  final Product product;
  final int index;
  final int? size;
  final bool? isBest;
  const ProductTileM(this.product,
      {super.key, required this.index, this.size, this.isBest});

  @override
  State<ProductTileM> createState() => _ProductTileMState();
}

class _ProductTileMState extends State<ProductTileM> {
  final String favorite = 'assets/icons/favorite.svg';
  final String favoriteOutline = 'assets/icons/favoriteOutline.svg';
  var f = NumberFormat('###,###,###,###');

  bool like = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      like = widget.product.like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(itemsId: widget.product.itemsId),
            preventDuplicates: false);
      },
      child: SizedBox(
        // margin: EdgeInsets.only(
        //     left: index == 0 ? 16 : 8, right: index == size - 1 ? 16 : 8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  height: 192,
                  child: Image.network(
                    widget.product.linkUrl.isNotEmpty
                        ? widget.product.linkUrl
                        : "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      print(exception.toString());
                      return const Text('error');
                    },
                  ),
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      color: ColorStyles.gray80.withOpacity(0.05),
                    ),
                    height: 192,
                  ),
                ),
                if (widget.isBest == true)
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 110.0,
                    child: Container(
                      alignment: Alignment.center,
                      height: 27,
                      decoration: const BoxDecoration(
                        color: ColorStyles.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3),
                            bottomRight: Radius.circular(3)),
                      ),
                      child: Text(
                        '${widget.index + 1}',
                        style: TextStyles.pretendardN14White,
                      ),
                    ),
                  ),
                Positioned(
                    bottom: -4,
                    right: -4,
                    child: IconButton(
                      onPressed: () async {
                        var memberId = await NetWorkHandler.getMemberId();
                        print(memberId);
                        if (memberId == 'null' || memberId == null) {
                          Get.to(() => AuthFirstPage());
                          Fluttertoast.showToast(
                              msg: '로그인 해주세요',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.black.withOpacity(0.7),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          if (like) {
                            bool result = await ProductServices.unlikeProduct(
                                widget.product.itemsId);
                            if (result) {
                              setState(() {
                                like = !like;
                              });
                            }
                          } else {
                            bool result = await ProductServices.likeProduct(
                                widget.product.itemsId);
                            if (result) {
                              setState(() {
                                like = !like;
                              });
                            }
                          }
                        }
                      },
                      icon: like == true
                          ? SvgPicture.asset(favorite)
                          : SvgPicture.asset(favoriteOutline),
                    ))
              ],
            ),
            const SizedBox(
              height: 9.5,
            ),
            Text('${widget.product.country} ・ ${widget.product.categoryName}',
                style: TextStyles.pretendardN11Gray60),
            const SizedBox(
              height: 2,
            ),
            Text(widget.product.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.pretendardN13Gray90),
            const SizedBox(
              height: 6,
            ),
            Text('${f.format(widget.product.price)} 원',
                style: TextStyles.pretendardN15Gray90),
            const SizedBox(
              height: 6,
            ),
            Text('${f.format(widget.product.viewCount ?? 0)}명이 보는 중',
                style: TextStyles.pretendardN11Gray60),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: ColorStyles.gray60,
                  size: 13.0,
                ),
                Text(
                    '${widget.product.rating}(${f.format(widget.product.ratingCount)})',
                    style: TextStyles.pretendardN11Gray60),
              ],
            )
          ],
        ),
      ),
    );
  }
}
