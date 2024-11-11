import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_deployment/features/home_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:model_deployment/features/home_screen/presentation/view_model/cubit/home_cubit.dart';

class FormData extends StatelessWidget {
  const FormData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state is HomeLoading){
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text("Loading..",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              content: Container(
                height: 0.3.sh,
                width: 0.5.sw,
                child: Center(child: CircularProgressIndicator(color: Colors.brown,)),
              ),
            ),);
          }
          if(state is HomeFailure){
            Navigator.pop(context);
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text("error",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              content: Container(
                height: 0.3.sh,
                width: 0.5.sw,
                child: Center(child: Text(state.errormsg)),
              ),
            ),);
          }

          if(state is HomeSuccess){
            Navigator.pop(context);
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text("The prediction",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              content: Container(
                height: 0.3.sh,
                width: 0.5.sw,
                child: Center(child: Text(state.predict)),
              ),
            ),);
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Algorithm",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                hint: const Text("Algorithm"),
                items: const [
                  DropdownMenuItem(
                    value: "XGBoost",
                    child: Text(
                      "XGBoost",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Random Forest",
                    child: Text(
                      "Random Forest",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "DNN_9",
                    child: Text(
                      "DNN_9",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "DNN_12",
                    child: Text(
                      "DNN_12",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "LightGBM",
                    child: Text(
                      "LightGBM",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "SVR",
                    child: Text(
                      "SVR",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Voting",
                    child: Text(
                      "Voting",
                    ),
                  ),
                ],
                onChanged: (value) {
                  cubit.algorithm = value;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Select Target",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                hint: const Text("Target"),
                items: const [
                  DropdownMenuItem(
                    value: "MC",
                    child: Text(
                      "MC",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "MR",
                    child: Text(
                      "MR",
                    ),
                  ),
                  DropdownMenuItem(
                    value: "DR",
                    child: Text(
                      "DR",
                    ),
                  ),
                ],
                onChanged: (value) {
                  cubit.target = value;
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Drying Time (min)",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
               Customtextfield(
                controller: cubit.dryingTimeCont,
                  hintText: "ex:120", borderColor: Colors.grey, obscure: false),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Velocity (m/s)",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
               Customtextfield(
                controller: cubit.velocityCont,
                  hintText: "ex:2", borderColor: Colors.grey, obscure: false),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Temperatures (C)",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              Customtextfield(
                controller: cubit.tempCont,
                  hintText: "ex:60", borderColor: Colors.grey, obscure: false),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Thickness (mm)",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
               Customtextfield(
                controller: cubit.thicknessCont,
                  hintText: "ex:120", borderColor: Colors.grey, obscure: false),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Sample Mass (gram)",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
             Customtextfield(
              controller: cubit.sampleMassCont,
                  hintText: "ex:120", borderColor: Colors.grey, obscure: false),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black54)),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      cubit.predict();
                    },
                    child: Text(
                      "Predict",
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
