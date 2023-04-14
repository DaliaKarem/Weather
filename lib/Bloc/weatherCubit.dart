import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/WeatherStates.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class weatherCubit extends Cubit<weatherstates>{
  WeatherService weatherService;
  WeatherModel ? weatherModel;
  String ?cityName;
  weatherCubit(this.weatherService) : super(initialweather());
  void getweather({required String Name})async{
    emit(loadingweather());
    try{
      weatherModel=await weatherService.getWeather(cityName: Name);
      emit(sucessweather());
    }
    on Exception catch(e){
      emit(errorweather());
    }
  }
}