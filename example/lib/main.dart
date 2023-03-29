
import 'package:custom_switcher/custom_switcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var switcherIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomSwitcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: CustomSwitcher(
                initialIndex: switcherIndex,
                totalWidth: MediaQuery.of(context).size.width - 6,
                cardUnselectedWidht: MediaQuery.of(context).size.width * 0.20,
                animationCurve: Curves.easeInOutCubicEmphasized,
                children: [
                  ItemCustomSwitcher(
                    child: Center(child: Text("Cricket", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.network("https://cdn-icons-png.flaticon.com/256/5971/5971593.png"),
                    ),
                  ),
                  ItemCustomSwitcher(
                    child: Center(child: Text("Golf", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.network("https://cdn-icons-png.flaticon.com/256/606/606058.png"),
                    ),
                    cardShadowColor: Colors.teal,
                  ),
                  ItemCustomSwitcher(
                    child: Center(child: Text("Motorsport", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.network("https://cdn-icons-png.flaticon.com/256/3089/3089028.png"),
                    ),
                  ),
                ],
                onChangue: (index) {
                  setState(() { this.switcherIndex = index; });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
