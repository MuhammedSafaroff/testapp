import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationCubit cubit = context.watch<NavigationCubit>();
    return BottomNavigationBar(
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          label: 'Profile',
        ),
      ],
      currentIndex: cubit.state,
      onTap: (index) {
        cubit.navigate(index);
      },
    );
  }
}
