import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/presentation/bloc/post/post_cubit.dart';
import 'package:testapp/presentation/pages/home/home_page.dart';

class Pages {
  static List<Widget> pages = [
    BlocProvider(
      create: (context) => PostCubit()..postFetch(),
      child: HomePage(),
    ),
    const SizedBox(
      child: Center(
        child: Text('Profile'),
      ),
    ),
  ];
}
