import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/constants/constant.dart';
import 'package:testapp/presentation/bloc/post/post_cubit.dart';
import 'package:testapp/presentation/pages/home/widgets/home_item.dart';
import 'package:testapp/presentation/widgets/custom_progress.dart';
import 'package:testapp/presentation/widgets/text_input.dart';
import 'package:testapp/presentation/widgets/widget.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    PostCubit cubit = context.read<PostCubit>();
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: maxWidth - 120,
                  child: TextInput(
                    hintText: 'Enter post id',
                    controller: controller,
                  ),
                ),
                SearchButton(
                  onPressed: () {
                    if (controller.text.isEmpty) {
                      cubit.postFetch();
                    } else {
                      cubit.postByIdFetch(int.parse(controller.text));
                    }
                  },
                ),
              ],
            ),
          ),
          Flexible(
            child: BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                if (state.isProgress) {
                  return const CustomProgress();
                } else if (state.isSuccess) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      final item = state.posts[index];
                      return FadeInUp(child: HomeItem(item: item));
                    },
                    itemCount: state.posts.length,
                  );
                } else if (state.isFailure) {
                  return SizedBox(
                    child: Center(
                      child: Text(
                        state.isFailureMessage,
                        style: AppTextStyles.openSans700.copyWith(
                          color: Colors.redAccent,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
