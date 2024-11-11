import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:model_deployment/features/home_screen/data/home_screen_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String? algorithm;
  String? target;
  TextEditingController dryingTimeCont = TextEditingController();
  TextEditingController velocityCont = TextEditingController();
  TextEditingController tempCont = TextEditingController();
  TextEditingController thicknessCont = TextEditingController();
  TextEditingController sampleMassCont = TextEditingController();
  HomeScreenRepo repo = HomeScreenRepo();
  static HomeCubit get(BuildContext context)=> BlocProvider.of<HomeCubit>(context);

  void predict()async{
    emit(HomeLoading());
    var result =await repo.getPrediction(algh: algorithm!, target: target!, dryingtime: dryingTimeCont.text,
     velocity: velocityCont.text, temperature: tempCont.text,
      thickness: thicknessCont.text, sampleMass: sampleMassCont.text);

      result.fold((l) {
        emit(HomeFailure(errormsg: l.errormsg));
      }, (r) {
        emit(HomeSuccess(predict: r));
      },);

  }
  
}
