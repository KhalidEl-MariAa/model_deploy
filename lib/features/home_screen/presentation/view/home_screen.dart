import 'package:flutter/material.dart';
import 'package:model_deployment/features/home_screen/presentation/view/widgets/form_data.dart';
import 'package:model_deployment/features/home_screen/presentation/view/widgets/title_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white,
      body: const CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              
              children: [
                TitleView(),
                FormData()
                
                
               
              ],
            )

          )
        ],
      ),
    ));
  }
}