import 'package:dartz/dartz.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:model_deployment/core/dio_helper/error_handler.dart';
import 'package:model_deployment/core/dio_helper/error_model.dart';

class HomeScreenRepo {
  Future<Either<ErrorModel,String>> getPrediction({
    required String algh,
    required String target,
    required String dryingtime,
    required String velocity,
    required String temperature,
    required String thickness,
    required String sampleMass,
  }) async{
    try{
     var response =  await Dio().post("https://ghost-honest-muskrat.ngrok-free.app/predict",
       options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data:{
    "algorithm":algh,
    "target":target,
  "drying_time": double.parse(dryingtime),
  "velocity": double.parse(velocity),
  "temperature": double.parse(temperature),
  "thickness": double.parse(thickness),
  "sample_mass": double.parse(sampleMass)
} );


Decimal value = Decimal.parse(response.data["prediction"][0][0].toString());

    return right(value.toStringAsFixed(2));
    }
    on DioException catch (e){
      if(e.response!=null){
   return left(ErrorModel(errormsg: e.response!.data.toString()));

      }
      else{
   String error = DioExceptionHandler.handleDioError(e);
   return left(ErrorModel(errormsg:error ));

      }
  }

  catch(e){
   return left(ErrorModel(errormsg: e.toString()));
  }
  }

  }
