import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int temperature = 26;
  bool isFanOn = false;
  bool isMotorOn = false;
  String noise = "high";
  int weight = 12;
  int humidity = 32;

  void setData(field, value) async {

    final response = await http
        .get(Uri.parse('https://api.thingspeak.com/update?api_key=W2MN4KOEHG4GKA6K&field$field=$value'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to set data');
    }
  }

  void readTemperatureData() async {

    final response = await http
        .get(Uri.parse('https://api.thingspeak.com/channels/2427690/fields/1.json?api_key=QZMRI80P6NU6XJYQ&results=2'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    readTemperatureData();
    super.initState();
    setData(2, 0);
    setData(4, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Kradle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: "DeliusSwashCaps",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 25, 30, 20),
                        child: Column(
                          children: [
                            Text(
                              "$weight Kg",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "weight",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(55, 25, 55, 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.water_drop),
                                const SizedBox(width: 5,),
                                Text(
                                  "$humidity %",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "Humidity level",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Card(
                  color: (temperature > 32) ? Colors.amber : (temperature <25 ) ? Colors.lightBlue[50] : Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.severe_cold,
                            color: (temperature > 32) ? Colors.red : (temperature <25 ) ? Colors.cyan : Colors.white,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            "Temperature: $temperature °C",
                            style: const TextStyle(
                                fontSize: 20,
                                letterSpacing: 2
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Card(
                  color: (noise == "high") ? Colors.amber : Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                      child: Row(
                        children: [
                          Icon(
                            (noise == "high") ? Icons.volume_up : Icons.volume_down,
                            color: (noise == "high") ? Colors.red : Colors.white,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            "Noise Level: $noise",
                            style: const TextStyle(
                                fontSize: 20,
                                letterSpacing: 2
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 45,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/music');
                          },
                          icon: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 25, 10, 25),
                              child: Icon(
                                  Icons.play_arrow_sharp,
                                size: 40,
                              ),
                          ),
                          label: const Text(
                            "Play Music",
                            style: TextStyle(
                              fontSize: 25
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/camera');
                          },
                          icon: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 25, 10, 25),
                            child: Icon(
                              Icons.camera,
                              size: 40,
                            ),
                          ),
                          label: const Text(
                            "Watch camera feed",
                            style: TextStyle(
                                fontSize: 25
                            ),
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: isFanOn ?
                      MaterialStateProperty.all<Color>(Colors.red) :
                      MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      setState(() {
                        if (isFanOn) {
                          isFanOn = false;
                          setData(2, 0);
                        } else {
                          isFanOn = true;
                          setData(2, 1);
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      child: Text(
                        isFanOn ? "Stop Fan" : "Start Fan",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    )
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isMotorOn ?
                    MaterialStateProperty.all<Color>(Colors.red) :
                    MaterialStateProperty.all<Color>(Colors.green),
                  ),
                    onPressed: () {
                      setState(() {
                        if (isMotorOn) {
                          isMotorOn = false;
                          setData(4, 0);
                        } else {
                          isMotorOn = true;
                          setData(4, 1);
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      child: Text(
                        isMotorOn ? "Stop Rocking" : "Start Rocking",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}