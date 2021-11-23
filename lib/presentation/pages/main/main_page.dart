import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/constants/constant.dart';
import 'package:testapp/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:testapp/presentation/widgets/widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, int>(builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: IndexedStack(
            index: state,
            children: Pages.pages,
          ),
        );
      }),
      bottomNavigationBar: const NavBar(),
    );
  }
}
