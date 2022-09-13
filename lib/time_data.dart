import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class Data{

  static List<String> Continents = ['Africa','America','Asia','Europe','Australia','Atlantic','Indian','Pacific'];
  static Map<String, List<String>> times = {};
  getdata() async {
    try {
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone'));
      print('Result: ${response.statusCode}');
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        // Condition to ignore some element like("Etc/GMT+1","Etc/GMT+10","Etc/GMT+11","Etc/GMT+12")
        if(data[i].indexOf('/') == -1 || !Data.Continents.contains(data[i].substring(0 , data[i].indexOf('/')))) continue;
        String City = data[i].substring(data[i].indexOf('/')+1);
        String Continent = data[i].substring(0 , data[i].indexOf('/'));
        if(!times.keys.contains(Continent)){
          times.putIfAbsent(Continent, () => []);
        }
        times[Continent]!.add(City);
      }
    }catch(e){
      print(e);
    }
  }

  getTime(String continent, String city) async{
    Response response2 = await get(Uri.parse('https://worldtimeapi.org/api/timezone/${continent}/${city}'));
    Map data2 = jsonDecode(response2.body);
    String datetime = data2['datetime'];
    String offset = data2['utc_offset'].substring(1,3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    String time = DateFormat.jm().format(now);
    return time;
  }
}
