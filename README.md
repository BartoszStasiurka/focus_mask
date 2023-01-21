
Package provides Widget with background mask.

## Example usage

![](https://github.com/BartoszStasiurka/focus_mask/blob/main/misc/circle.png?raw=true)
![](https://github.com/BartoszStasiurka/focus_mask/blob/main/misc/square.png?raw=true)
![](https://github.com/BartoszStasiurka/focus_mask/blob/main/misc/rectangle.png?raw=true)
![](https://github.com/BartoszStasiurka/focus_mask/blob/main/misc/offset.png?raw=true)

## Getting started

Add package to your pubspec.yaml and ```import 'package:focus_mask/focus_mask.dart';```

## Usage

### Circle mask
```dart
FocusMask.circle(
    point: Offset(100, 100),
    radius: 50,
);
```
### Sqare mask
```dart
FocusMask.square(
          point: Offset(100, 100),
          size: slider * 3,
        );
```

### Rectangle mask
```dart
FocusMask.rectangle(
    point: Offset(100, 100),
    width: 50,
    height: 50,
);
```

### Offset mask
```dart
FocusMask.offset(
    offset: EdgeInsets.symmetric(
    vertical: 50,
    horizontal: 50,
    ),
);
```


## Contribition

FocusMask widget using CustomPainter, so you can write your own:

```dart
FocusMask(
      painter: HERE_YOUR_CUSTOM_PAINTER,
    );
```

For example, ```FocusMask.circle()``` is the same as:
```dart
FocusMask(
      painter: FocusMaskCirclePainter(point: point, radius: radius, color: color)
    );
```

Feel free to contribute. 