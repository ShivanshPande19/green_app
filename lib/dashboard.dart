import 'package:flutter/material.dart';
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('images/main_screen_logo.png',
                    fit: BoxFit.contain,
                  ),

                  // this align will place some text at bottom left of sliver
                  // maybe i will need it
                  // const Align(
                  //   alignment: Alignment.bottomLeft,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(16.0),
                  //     child: Text(
                  //       'Your Title Here',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 24.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
