import 'package:flutter/material.dart';
import 'package:valt/model/product.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final int index;
  final int size;
  ProductTile(this.product,
      {super.key, required this.index, required this.size});

  var f = NumberFormat('###,###,###,###');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: index == 0 ? 16 : 8, right: index == size - 1 ? 16 : 8),
      width: 136,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: <Widget>[
            Container(
              height: 192,
              width: 136,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: NetworkImage(product.linkUrl)),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: ColorStyles.gray80.withOpacity(0.05),
                  ),
                  height: 192,
                  width: 136),
            ),
            Positioned(
              top: 5.0,
              left: 0.0,
              right: 0.0,
              child: Text('${index + 1}'),
            )
          ]),
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
          Text('${f.format(1234)}명이 보는 중',
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
              Text('${5.0}(${f.format(1234)})',
                  style: TextStyles.pretendardN11Gray60),
            ],
          )
        ],
      ),
    );
  }
}
