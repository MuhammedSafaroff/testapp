import 'package:flutter/material.dart';
import 'package:testapp/core/constants/constant.dart';
import 'package:testapp/data/models/response/post_res_model.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({Key? key, required this.item}) : super(key: key);
  final PostResModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              item.title!,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.openSans600.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              item.body!.substring(0, item.body!.length ~/ 2),
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.openSans500.copyWith(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
