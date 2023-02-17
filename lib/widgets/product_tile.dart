import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valt/model/product.dart';
import 'package:valt/screens/product_detail.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final int index;
  final int size;
  final String favorite = 'assets/icons/favorite.svg';
  final String favoriteOutline = 'assets/icons/favoriteOutline.svg';

  ProductTile(this.product,
      {super.key, required this.index, required this.size});

  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(itemsId: product.itemsId));
      },
      child: SizedBox(
        // margin: EdgeInsets.only(
        //     left: index == 0 ? 16 : 8, right: index == size - 1 ? 16 : 8),
        width: 136,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                    height: 192,
                    width: 136,
                    child: Image.network(
                      index == 0
                          ? "https://whiskey-platform.s3.ap-northeast-2.amazonaws.com/images/WHIKSY_W10.png"
                          : product.linkUrl,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        print(exception.toString());
                        return const Text('error');
                      },
                    )),
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
                    width: 136,
                  ),
                ),
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
                      '${index + 1}',
                      style: TextStyles.pretendardN14White,
                    ),
                  ),
                ),
                Positioned(
                    bottom: -4,
                    right: -4,
                    child: IconButton(
                      onPressed: () {},
                      icon: product.like == true
                          ? SvgPicture.asset(favorite)
                          : SvgPicture.asset(favoriteOutline),
                    ))
              ],
            ),
            const SizedBox(
              height: 9.5,
            ),
            Text('${product.country} ・ ${product.categoryName}',
                style: TextStyles.pretendardN11Gray60),
            const SizedBox(
              height: 2,
            ),
            Text(product.name, style: TextStyles.pretendardN13Gray90),
            const SizedBox(
              height: 6,
            ),
            Text('${f.format(product.price)} 원',
                style: TextStyles.pretendardN15Gray90),
            const SizedBox(
              height: 6,
            ),
            Text('${f.format(product.viewCount ?? 0)}명이 보는 중',
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
                Text('${product.rating}(${f.format(product.ratingCount)})',
                    style: TextStyles.pretendardN11Gray60),
              ],
            )
          ],
        ),
      ),
    );
  }
}
