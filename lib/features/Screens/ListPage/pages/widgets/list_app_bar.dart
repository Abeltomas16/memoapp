import 'package:flutter/material.dart';

class ListAppbar extends StatelessWidget {
  const ListAppbar({Key? key, required this.onBack}) : super(key: key);
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blue,
      pinned: true,
      elevation: 0,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(
          Icons.chevron_left,
          size: 40,
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.more_vert,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
