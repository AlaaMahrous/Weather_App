
class WeatherMainModel {
    const WeatherMainModel({
        required this.location,
        required this.current,
        required this.forecast,
    });
    final Location location;
    final Current current;
    final Forecast forecast;

    factory WeatherMainModel.fromJson(Map<String, dynamic> json){
        return WeatherMainModel(
            location: Location.fromJson(json['location']), 
            current: Current.fromJson(json['current']), 
            forecast: Forecast.fromJson(json['forecast']),
        );
    }

}

class Location {
    const Location({
        required this.name,
        required this.localtime,
    });
    final String name;
    final DateTime localtime;
    
    factory Location.fromJson(Map<String, dynamic> json){
        return Location(
            name: json['name'], 
            localtime: DateTime.parse(json['localtime']),
        );
    }

}

class Current {
    const Current({
        required this.lastUpdated,
        required this.currentTemp,
        required this.condition
    });
    final String lastUpdated;
    final double currentTemp;
    final Condition condition;

    factory Current.fromJson(Map<String, dynamic> json){
        return Current(
            lastUpdated: json['last_updated'], 
            currentTemp: json['temp_c'], 
            condition: Condition.fromJson(json['condition']),
        );
    }

}

class Condition {
    const Condition({
        required this.text,
        required this.icon,
    });
    final String text;
    final String icon;

    factory Condition.fromJson(Map<String, dynamic> json){
        return  Condition(
            text: json['text'], 
            icon: json['icon'],
        );
    }

}

class Forecast {
    Forecast({
        required this.forecastday,
    });
    final List<Forecastday> forecastday;

    factory Forecast.fromJson(Map<String, dynamic> json){
        return Forecast(
            forecastday: List<Forecastday>.from(
                json['forecastday'].map((x) => Forecastday.fromJson(x))
            )
        );
    }

}

class Forecastday {
    const Forecastday({
        required this.date,
        required this.day
    });
    final String date;
    final Day day;

    factory Forecastday.fromJson(Map<String, dynamic> json){
        return Forecastday(
            date: json['date'], 
            day: Day.fromJson(json['day']),
        );
    }

}

class Day {
    const Day({
        required this.maxtempC,
        required this.mintempC,
        required this.avgtempC,
    });
    final double maxtempC;
    final double mintempC;
    final double avgtempC;

    factory Day.fromJson(Map<String, dynamic> json){
        return Day(
            maxtempC: json['maxtemp_c'], 
            mintempC: json['mintemp_c'], 
            avgtempC: json['avgtemp_c'],
        );
    }

}