import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              
              children: [
                Text("FISH BY-PRODUCTS DRYING",style: TextStyle(fontSize: 15.sp,color: Colors.brown,fontWeight: FontWeight.bold),),
                SizedBox(height: 5.sp,),
                Container(
                  height: 0.28.sh,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image:AssetImage("assets/dnn.png"),fit:BoxFit.fill)
                  ),
                )
              ],
            );
  }
}