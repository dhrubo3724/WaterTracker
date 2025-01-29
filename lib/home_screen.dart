import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final TextEditingController _glsCountController =
      TextEditingController(text: '1');
  List<Waterconsume> waterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Total Water Count is : ${_totalWaterCount()} ",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Tap Here ",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: _addwater,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(59),
                    border: Border.all(color: Colors.cyan, width: 8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.water_drop_outlined,
                    color: Colors.cyan,
                    size: 70,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _glsCountController,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: waterConsumeList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(waterConsumeList[index].time.toString()),
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      trailing:
                          Text(waterConsumeList[index].glscount.toString()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void _addwater() {
    int glscount = int.tryParse(_glsCountController.text) ?? 1;
    Waterconsume waterConsume =
        Waterconsume(time: DateTime.now(), glscount: glscount);
    waterConsumeList.add(waterConsume);
    setState(() {});
  }

  int _totalWaterCount() {
    int totalcount = 0;
    for (Waterconsume waterconsume in waterConsumeList) {
      totalcount += waterconsume.glscount;
    }
    return totalcount;
  }
}

class Waterconsume {
  final DateTime time;
  final int glscount;

  Waterconsume({required this.time, required this.glscount});
}
