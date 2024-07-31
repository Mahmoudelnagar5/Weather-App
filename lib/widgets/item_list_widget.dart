import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatther_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/today_item.dart';
import 'package:weather_app/widgets/weathe_info_body.dart';
import 'package:intl/intl.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<Hour> hours =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel.hours;
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;

    return SizedBox(
      height: 141,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: hours.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodayItem(
                time: DateFormat.jm().format(hours[index].time),
                degree: hours[index].tempC,
                imagePath:
                    getWeatherImagePath(condition: weatherModel.condtion)),
          );
        },
      ),
    );
  }
}
