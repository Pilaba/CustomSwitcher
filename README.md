# CustomSwitcher

Customizable UI widget made for flutter similar to a content switcher


## Installations

Add `custom_switcher: ^1.0.0` in your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:custom_switcher/custom_switcher.dart';
```

## How to use

```dart
  CustomSwitcher(
    children: [
      ItemCustomSwitcher(
        child: Center(child: Text("Cricket", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),),
        icon: Icon(Icons.sunny, color: Colors.amber,),
      ),
      ItemCustomSwitcher(
        child: Center(child: Text("Golf", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),),
        icon: Icon(Icons.egg_alt_rounded, color: Colors.teal,)
      ),
      ItemCustomSwitcher(
        child: Center(child: Text("Motorsport", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),),
        icon: FlutterLogo()
      ),
    ],
  )
```

For a more detail example please take a look at the `example` folder.

## Demo

<img src="https://raw.githubusercontent.com/Pilaba/CustomSwitcher/main/example/gif.gif" width="500" height="1000">


## -

If something is missing, feel free to open a ticket or contribute!

